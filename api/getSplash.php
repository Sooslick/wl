<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

$fname = "SPLASH.TXT";
$final = "YOURE FAILED";
if (file_exists($fname))
  {
  $content = file_get_contents($fname);
  }
if ($content === false)
  {
  $final = "TOO HARD TO READ";
  }
else
  {
  $content = str_replace("\r", "", $content);
  $arr = explode("\n", $content);
  $max = count($arr);
  $final = $arr[mt_rand(0, $max-1)];
  }

//return json
$answer = array("CONTENT" => $final);
echo(json_encode($answer));

file_put_contents('log/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' getSplash request', FILE_APPEND);
?>