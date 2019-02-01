<?php
set_time_limit(1);

function readLong(&$array, $from) {
	$long = 0;
	for ($i=$from; $i<$from+4; $i++) {
		$long = $long*256 + $array[$i];
	}
	return $long;
}

$fn = 'saves/save' . $_GET['SAVE'];
echo "$fn <br>";
if (!file_exists($fn)) {
	echo "File not exists";
	exit;
	}
$sav_raw = file_get_contents($fn);
for ($i=0; $i < strlen($sav_raw); $i++)
	$sav[$i] = ord($sav_raw[$i]);
echo "<br>";

echo "Save version: $sav[0].$sav[1].$sav[2].$sav[3] <br>";


$tmp = readLong($sav, 4);
echo "Save timestamp: $tmp <br>";

$tmp = readLong($sav, 8);
echo "PNETID: $tmp <br>";

$tmp = $sav[12];
$pos = 13;
$str = "";
while ($tmp > 0) {
	$str.= chr($sav[$pos]);
	$pos++;
	$tmp--;
}
echo "Display name: $str <br>";

$tmp = $sav[$pos];
$pos++;
echo "Used locale: $tmp <br>";

$tmp = '';
for ($i = 0; $i < 12; $i++) {
	$tmp+= $sav[$pos];
	$pos++;
	}
echo "Last headline: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Ingame time: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Play time: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Online time: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Games played: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Games ended: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Rooms visited: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Stat resets: $tmp <br>";

$tmp = $sav[$pos];
$pos++;
echo "Simple mode passed: $tmp <br>";

$tmp = $sav[$pos];
$pos++;
echo "Advanced mode passed: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Player lvl: $tmp <br>";

$tmp = readLong($sav, $pos);
$pos+= 4;
echo "Player xp: $tmp <br>";

$tmp = $sav[$pos];
$pos++;
echo "Game stat data sections: $tmp <br>";

echo "read sections - todo";
?>