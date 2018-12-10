<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//check _GET parameters
$ok = true;
$err_string = '';
if (!empty($_GET['access_token'])) {
	$at = $_GET['access_token'];}
else {
	$ok = false;
	$err_string = 'No token passed';
}
if (!empty($_POST['bytes'])) {
	$bytes = $_POST['bytes'];}
else {
	$ok = false;
	$err_string = 'No bytes passed';
}

//check main database
if ($ok)
{
	//ini fields
	$ini = parse_ini_file("../../stuff/phpcfg.ini");
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
	$req = "SELECT PNETID FROM main_users WHERE ACCESS_TOKEN = \"$at\"";
	//db select
	$stmt = $pdo->query($req);
	$response = $stmt->fetch();
	if (empty($response)) {$ok = false; $err_string = 'User not found';}
	else {
		$pnetid = $response['PNETID'];}
}

//decode
if ($ok) {
	//file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' saveFile request log: '.substr($bytes, 0, 24), FILE_APPEND);
	$decoded = '';
	$pos = 0;
	while ($pos < strlen($bytes)) {
		$decoded.= chr(hexdec($bytes[$pos] . $bytes[$pos+1]));
		$pos+= 2;
	}
	$bytes = $decoded;
	//validate
	if (ord($bytes[3])>=6) {
		$a = 0;
		for ($i=0; $i<4; $i++)
			$a = $a*256 + ord($bytes[8+$i]);
		if ($a != $pnetid) {
			$ok = false;
			$err_string = "bad save id: $a";
		}
	}
	else {
		$ok = false;
		$err_string = 'bad save version: '.ord($bytes[0]).'.'.ord($bytes[1]).'.'.ord($bytes[2]).'.'.ord($bytes[3]);
	}
}

//update
if ($ok)
{
	$fn = 'saves/save' . strval($pnetid);
	$f = fopen($fn, 'w');
	$bw = fwrite($f, $bytes);
	$req = "UPDATE wl SET SAVELINK = \"$fn\" WHERE PNETID = $pnetid";
	$stmt = $pdo->query($req);
	if ($bw == false) {
		$ok = false;
		$err_string = 'file write error';
	}
}

//TODO: get XP & LV to update db info

//return json
if ($ok)
{
	$answer = array("SIZE" => $bw, "SAVELINK" => $fn);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' saveFile request: success; PNETID: ' . $pnetid, FILE_APPEND);
}
else
{
	$answer = array("ERROR" => $err_string);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' saveFile request: fail; Error message: ' . $err_string, FILE_APPEND);
}
?>