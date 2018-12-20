<?php

//params:
//$filter - string, load news by tag
$filter = 'wordladder';
//$from - int, first header to read
$from = 0;
//$last_ind - long, last read index
$last_ind = $_GET['DATE'];
if (empty($last_ind))
		$last_ind = 0;

//check news list
$newsDirArrRaw = scandir('../news', 1);

if (!empty($filter))
	$filterReg = "/^[0-9]{12}-$filter/";
else
	$filterReg = "/^[0-9]{12}/";
$newsDirArr = preg_grep($filterReg, $newsDirArrRaw);
$keys = array_keys($newsDirArr);

$ct = count($newsDirArr);
$to = $from + 10;

if ($to > $ct) 
	$to = $ct;

for ($i=$from; $i<$to; $i++) {
	$k = $keys[$i];
	if ($newsDirArr[$k] <= $last_ind)
		break;
	//print news content
	$art['CONTENT'] = file_get_contents('../news/' . $newsDirArr[$k] . '/content');
	$art['CONTENT'] = str_replace("<", "&#60;", $art['CONTENT']);
	$art['CONTENT'] = str_replace(">", "&#62;", $art['CONTENT']);
	
	$a = scandir('../news/' . $newsDirArr[$k], 1);
	//attachments format: img
	$imgct = 0;
	$imgArr = null;
	for ($j=0; $j < count($a); $j++) {
		if (preg_match("/.*\.(jpg$|png$)/", $a[$j]) > 0) {
			$imgArr[$imgct] = $a[$j];
			$imgct++;
			}
		}

	$art['ATTACHMENTS'] = $newsDirArr[$k] . '/' . $imgArr[0];
	//todo: meta
	$art['TIMESTAMP'] = substr($newsDirArr[$k], 6, 2) . '-' . substr($newsDirArr[$k], 4, 2) . '-' . substr($newsDirArr[$k], 0, 4) . ' ' .
		substr($newsDirArr[$k], 8, 2) . ':' . substr($newsDirArr[$k], 10, 2);
	$news[$k] = $art;
	}

$answer = array("NEWS_DIR" => "news", "NEWS" => $news);
echo(json_encode($answer));

file_put_contents('../../wl/apilog.txt', PHP_EOL . date('d.m.y H:i:s') . ' getNews request', FILE_APPEND);

?>