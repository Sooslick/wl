<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//check _GET parameters
$ok = true;
$err_string = '';

//format roomlist
$dir = '../../wl/rooms';
$all = scandir($dir, 1);
$ct = count($all) - 2;
if ($ct > 0) {
	$rand = rand(0, $ct-1);
	$fn = $dir . '/' . $all[$rand];
	$f = fopen($fn, 'r');
	fgets($f);				//upd not req
	$room['PNETID'] = str_replace("\n","",fgets($f));
	$room['IP'] = str_replace("\n","",fgets($f));
	$room['GM'] = str_replace("\n","",fgets($f));
	$room['STATE'] = str_replace("\n","",fgets($f));
	$room['PLS'] = str_replace("\n","",fgets($f));
	$room['WORDS'] = str_replace("\n","",fgets($f));
	$room['ID'] = str_replace("r","",$all[$rand]);
	fclose($f);
}

//return json
if ($ok)
{
	echo(json_encode($room));
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' randRoom request', FILE_APPEND);
}
?>