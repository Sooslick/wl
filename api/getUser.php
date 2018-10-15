<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//check _GET parameters
$ok = true;
$err_string = '';
if (!empty($_GET['pnetid'])) {$pnetid = $_GET['pnetid'];}
else {$ok = false; $err_string = 'No PNETID param passed';}

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
	$req = "SELECT * FROM wl WHERE PNETID = \"$pnetid\"";
	//db select
	$stmt = $pdo->query($req);
	$response = $stmt->fetch();
	if (empty($response)) {$ok = false; $err_string = 'User not found';}
}

//return json
if ($ok)
{
	$answer = array("PNETID" => $pnetid, "DISPLAY_NAME" => $response['DISPLAY_NAME'], "XP" => $response['XP'], "LV" => $response['LV']);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' getUser request', FILE_APPEND);
}
else
{
	$answer = array("ERROR" => $err_string);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' authUser request: fail; Error message: ' . $err_string, FILE_APPEND);
}
?>