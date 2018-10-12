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
if (!empty($_GET['rid'])) {
	$rid = $_GET['rid'];}
else {
	$ok = false;
	$err_string = 'No roomID passed';
}
if (!empty($_GET['state'])) {
	$state = $_GET['state'];}
if (!empty($_GET['players'])) {
	$pls = $_GET['players'];}
if (!empty($_GET['words'])) {
	$words = $_GET['words'];}

//check room
if ($ok)
{
	$fn = '../../wl/rooms/r' . strval($rid);
	if (!file_exists($fn))
	{
		$ok = false;
		$err_string = 'Room not found';
	}
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

//read static fields &
//update
if ($ok)
{
	//read
	$f = fopen($fn, 'r');
	fgets($f);				//upd not required
	fgets($f);				//pnetid not required
	$ip = str_replace("\n","",fgets($f));	//ip
	$gm = str_replace("\n","",fgets($f));	//gamemode
	if (isset($state)) {
		fgets($f);}
	else {
		$state = str_replace("\n","",fgets($f));}
	if (isset($pls)) {
		fgets($f);}
	else {
		$pls = str_replace("\n","",fgets($f));}
	if (isset($words)) {
		fgets($f);}
	else {
		$words = str_replace("\n","",fgets($f));}
	fclose($f);
	//write
	$f = fopen($fn, 'w');
	$rcon = strval(time()) . "\n"		//last upd
	. strval($pnetid) . "\n"		//host pnetid
	. $ip . "\n"				//host ip
	. $gm . "\n"			//gametype
	. strval($state) . "\n"					 //gamestate, pls, words
	. strval($pls) . "\n"
	. strval($words) . "\n";
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
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' updRoom request: success; PNETID: ' . $pnetid . '; IP: ' . $ip, FILE_APPEND);
}
else
{
	$answer = array("ERROR" => $err_string);
	echo(json_encode($answer));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' updRoom request: fail; Error message: ' . $err_string, FILE_APPEND);
}
?>