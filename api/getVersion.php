<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

$v = "263";

//return json
$answer = array("VERSION" => $v);
echo(json_encode($answer));

file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' getVersion request', FILE_APPEND);
?>