<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//check _GET parameters
$ok = true;
$err_string = '';
$token = -1;
if (!empty($_GET['login'])) {$login = $_GET['login'];}
if (!empty($_GET['vkid'])) {$vkid = $_GET['vkid'];}
if (!empty($_GET['pnetid'])) {$pnetid = $_GET['pnetid'];}
if (!empty($_GET['passw'])) {$passw = $_GET['passw'];}

if ((empty($login))&&(empty($vkid))&&(empty($pnetid))) {$ok = false; $err_string = 'No login passed';}
if ((empty($passw))&&(empty($vkid))) {$ok = false; $err_string = 'No login passed';}

//check main database
if ($ok)
{
	//ini fields
	$ini = parse_ini_file("../stuff/phpcfg.ini");
	//db connect info
	$dbs = "mysql:host=127.0.0.1;dbname=" . $ini['db'] . ";charset=utf8";
	$opt = array(
		PDO::ATTR_ERRMODE	     => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC);
	$dbp = $ini['pw'];
	$dbn = $ini['db'];
	try {
		$pdo = new PDO($dbs, $dbn, $dbp, $opt);
	}
	catch (PDOException $e) {
		$ok = false;
		$err_string = 'Database error. Don\'t worry, we will dismiss our programmer soon.';
	}
}


if ($ok)
{	
	//log by pnetid
	if ((!empty($pnetid))&&(!empty($passw))) {
		$logtype = 1;
		$req = "SELECT * FROM main_users WHERE PNETID = \"$pnetid\"";
	}
	//log by login
	elseif ((!empty($login))&&(!empty($passw))) {
		$logtype = 2;
		$req = "SELECT * FROM main_users WHERE UNAME = \"$login\"";
	}
	//log by vkid
	else {
		$logtype = 3;
		$req = "SELECT * FROM main_users WHERE VKID = \"$vkid\"";
	}
	//db select
	$stmt = $pdo->query($req);
	$response = $stmt->fetch();
	if (empty($response)) {$ok = false; $err_string = 'User not found';}
	else
	{
		if ($logtype < 3) {
			if (($response['PASSW'] != $passw))
			{
				$ok = false;
				$err_string = 'Wrong password';
			}
		}
		if ($ok)
		{
			$pnetid = $response['PNETID'];
			$nick = $response['DISPLAY_NAME'];
		}
	}
}

//update
if ($ok)
{
	$req = "SELECT DISPLAY_NAME, SAVELINK FROM wl WHERE PNETID = $pnetid";
	$stmt = $pdo->query($req);
	$response = $stmt->fetch();
	if (empty($response))
	{
		$sq = "INSERT INTO wl (PNETID, DISPLAY_NAME) VALUES ($pnetid, \"$nick\")";
		$stmt = $pdo -> query($sq);
		$savelink = '';
	}
	else
	{
		$nick = $response['DISPLAY_NAME'];
		$savelink = $response['SAVELINK'];
	}

	//gen token
	$at = sha1(strval($pnetid) . strval(time()));
	$req = "UPDATE main_users SET ACCESS_TOKEN = \"$at\" WHERE PNETID = $pnetid";
	$stmt = $pdo->query($req);
}

//return json
if ($ok)
{
	$answer = array("PNETID" => $pnetid, "ACCESS_TOKEN" => $at, "DISPLAY_NAME" => $nick, "SAVELINK" => $savelink);
	echo(json_encode($answer));
	file_put_contents('log/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' authUser request: success; PNETID: ' . $pnetid . '; Login by: ' . $logtype, FILE_APPEND);
}
else
{
	$answer = array("ERROR" => $err_string);
	echo(json_encode($answer));
	file_put_contents('log/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' authUser request: fail; Error message: ' . $err_string, FILE_APPEND);
}
?>