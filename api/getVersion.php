<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

//todo: get versions from config
$v = "267";
$e = "1";
$p = "http://sooslick.mlbrony.ru/wl/dict/EN_extra.dat";

//return json
$answer = array("VERSION" => $v, "EXTRA" => $e, "EXTRA_PATH" => $p);
echo(json_encode($answer));

file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' getVersion request', FILE_APPEND);
?>