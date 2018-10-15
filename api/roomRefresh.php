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
$rm = 0;
for ($i = 0; $i < $ct; $i++) {
	$fn = $dir . '/' . $all[$i];
	$f = fopen($fn, 'r');
	$delay = time() - intval(str_replace("\n","",fgets($f)));
	fclose($f);
	if ($delay > 999) {
		unlink ($fn);
		$rm++;
	}
}

//return json
if ($ok)
{
	echo($rm . ' rooms removed');
	file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' roomRefresh task completed: ' . strval($rm) . ' rooms deleted', FILE_APPEND);
}
?>