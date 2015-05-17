<?php

if($terminal['PLAYER_PASSWORD']==''){
	$terminal['PLAYER_PASSWORD'] = NULL;
}
include 'mpd.class.php';
$mpd = new mpd($terminal['HOST'], $terminal['PLAYER_PORT'], $terminal['PLAYER_PASSWORD']);
  
if($mpd->connected) {
    if ($command=='refresh') {
	$mpd->PLClear();
	$mpd->DBRefresh();
        $path=preg_replace('/\\\\$/is', '', $out['PLAY']);
        
        $db=SQLSelect("SELECT * FROM collections ORDER BY TITLE");
        $total=count($db);
        for($i=0;$i<$total;$i++) {
            if ($db[$i][PATH]{0}=='/'){
            $path=str_replace($db[$i][PATH], '', $path);
            break;
            }
        }
        $path=str_replace('\\', '/', $path);
        $path=str_replace('./', '', $path);
     	//echo $path;
        $mpd->PLAdd($path);
	$mpd->Play();  
    } 
	if ($command=='pause') {
            $mpd->Pause();
	} 
	if ($command=='next') {
            $mpd->Next();
	}
	if ($command=='prev') {
            $mpd->Previous();
	}
	if ($command=='volume') {
            $mpd->SetVolume($volume);
	}
	if ($command=='close') {
            $mpd->Stop();
	} 
	$mpd->Disconnect();
} else {
	echo "Error: " .$mpd->errStr;
}
?>