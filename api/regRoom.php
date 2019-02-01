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
if (isset($_GET['gmode'])) {
	$gm = $_GET['gmode'];}
else {
	$gm = -1;}
$ip = $_SERVER['REMOTE_ADDR'];

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
	$req = "SELECT PNETID, DISPLAY_NAME FROM main_users WHERE ACCESS_TOKEN = \"$at\"";
	//db select
	$stmt = $pdo->query($req);
	$response = $stmt->fetch();
	if (empty($response)) {$ok = false; $err_string = 'User not found';}
	else {
		$pnetid = $response['PNETID'];
		$name = $response['DISPLAY_NAME'];
		}
}

//update
if ($ok)
{
	$rid = time();
	$fn = '../../wl/rooms/r' . strval($rid);
	$f = fopen($fn, 'w');
	$rcon = strval($rid) . "\n"		//last upd
	. strval($name) . "\n"			//host name	//todo: store pnetid such as time ago
	. $ip . "\n"				//host ip
	. strval($gm) . "\n"			//gametype
	. "0\n1\n0\n";				//gamestate, pls, words
	$bw = fwrite($f, $rcon);
	if ($bw == false) {
		$ok = false;
		$err_string = 'file write error';
	}
}

//return json
if ($ok)
{
	$answer = array("ROOMID" => $rid);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' regRoom request: success; PNETID: ' . $pnetid . '; IP: ' . $ip, FILE_APPEND);
}
else
{
	$answer = array("ERROR" => $err_string);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' regRoom request: fail; Error message: ' . $err_string, FILE_APPEND);
}
?>