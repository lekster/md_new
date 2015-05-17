<?php
/*
* @version 0.2 (auto-set)
*/
 chdir('../');


 include_once("./config.php");
 include_once("./lib/loader.php");


 $db=new mysql(DB_HOST, '', DB_USER, DB_PASSWORD, DB_NAME); // connecting to database
 include_once("./load_settings.php");

 set_time_limit(6000);


  set_time_limit(6000);
  $records=SQLSelect("SELECT ID, DEVICEID, LOCATION_ID FROM gpslog ORDER BY DEVICEID, ADDED DESC");
  $total=count($records);
  $to_delete=array();
  for($i=1;$i<$total-1;$i++) {
   if (!$records[$i]['LOCATION_ID']) continue;
   if ($records[$i]['LOCATION_ID']==$records[$i+1]['LOCATION_ID'] && $records[$i]['LOCATION_ID']==$records[$i-1]['LOCATION_ID']) {
    //$to_delete[]=$records[$i]['ID'];
    SQLExec("DELETE FROM gpslog WHERE ID=".$records[$i]['ID']);
   }

   if ($i%200==0) {
     echo ".";
     echo str_repeat(' ', 1024);
     flush();
     flush();
   }

  }
  /*
  if ($to_delete[0]) {
   $total=count($to_delete);
   for($i=0;$i<$total;$i++) {
    SQLExec("DELETE FROM gpslog WHERE ID=".$to_delete[$i]);
   }
   $this->redirect("?");
  }
  */
  SQLExec("OPTIMIZE TABLE `gpslog`");

     echo " DONE";
     echo str_repeat(' ', 1024);
     flush();
     flush();

     exit;





 print_r($removed);

 $db->Disconnect(); // closing database connection

 DebMes("Optimize history script finished");

/**
* Title
*
* Description
*
* @access public
*/
 function optimizeHistoryData($value_id, $type, $interval, $start, $end) {

   $total_removed=0;
   if (!$interval) {
    return 0;
   }
   echo "Value ID: $value_id <br>";
   echo "Interval from ".date('Y-m-d H:i:s', $start)." to ".date('Y-m-d H:i:s', $end)." (every ".$interval." seconds)<br>";
   $total_values=(int)current(SQLSelectOne("SELECT COUNT(*) FROM phistory WHERE VALUE_ID='".$value_id."' AND ADDED>='".date('Y-m-d H:i:s', $start)."' AND ADDED<='".date('Y-m-d H:i:s', $end)."' "));
   echo "Total values: ".$total_values."<br>";
   if ($total_values<2) {
    return 0;
   }

   $tmp=$end-$start;
   $tmp2=round($tmp/$interval);
   if ($total_values<=$tmp2) {
    echo "... number of values ($total_values) is less than optimal (".$tmp2.") (skipping)<br>";
    return 0;
   }

   echo "Optimizing (should be about ".$tmp2." records)...";

   echo str_repeat(' ', 1024);
   flush();
   flush();

   $first_start=current(SQLSelectOne("SELECT UNIX_TIMESTAMP(ADDED) FROM phistory WHERE VALUE_ID='".$value_id."' AND ADDED>='".date('Y-m-d H:i:s', $start)."' ORDER BY ADDED LIMIT 1"));
   $last_start=current(SQLSelectOne("SELECT UNIX_TIMESTAMP(ADDED) FROM phistory WHERE VALUE_ID='".$value_id."' AND ADDED<='".date('Y-m-d H:i:s', $end)."' ORDER BY ADDED DESC LIMIT 1"));

   while($start<$end) {

    if ($start<($first_start-$interval)) {
     $start+=$interval;
     continue;
    }

   if ($start>($last_start+$interval)) {
     $start+=$interval;
     continue;
    }

    //echo date('Y-m-d H:i:s', $start)."<br>\n";
   echo ".";
   echo str_repeat(' ', 1024);
   flush();
   flush();

    $data=SQLSelect("SELECT * FROM phistory WHERE VALUE_ID='".$value_id."' AND ADDED>='".date('Y-m-d H:i:s', $start)."' AND ADDED<'".date('Y-m-d H:i:s', $start+$interval)."'");
    $total=count($data);
    if ($total>1) {
     $values=array();
     for($i=0;$i<$total;$i++) {
      $values[]=$data[$i]['VALUE'];
     }
     if ($type=='max') {
      $new_value=max($values);
     } elseif ($type=='sum') {
      $new_value=array_sum($values);
     } else {
      $new_value=array_sum($values)/$total;
     }
     SQLExec("DELETE FROM phistory WHERE VALUE_ID='".$value_id."' AND ADDED>='".date('Y-m-d H:i:s', $start)."' AND ADDED<'".date('Y-m-d H:i:s', $start+$interval)."'");
     $rec=array();
     $rec['VALUE_ID']=$value_id;
     $rec['VALUE']=$new_value;
     if ($type=='avg') {
      $rec['ADDED']=date('Y-m-d H:i:s', $start+(int)($interval/2));
     } else {
      $rec['ADDED']=date('Y-m-d H:i:s', $start+$interval-1);
     }
     SQLInsert('phistory', $rec);
     $total_removed+=$total;
     //echo "DONE ($total deleted)<br>";
     //print_r($rec);
     //exit;
    } else {
     //echo "skip mini interval ($total)<br>";
    }

    $start+=$interval;
   }

   echo "<b>Done</b> (removed: $total_removed)<br>";
   SQLExec("OPTIMIZE TABLE `phistory`");

   return $total_removed;

 }

?>
