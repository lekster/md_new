<?php
/**
* Test script
*
* @package MajorDoMo
* @author Serge Dzheigalo <jey@tut.by> http://smartliving.ru/
* @version 1.3
*/

include_once("./config.php");
include_once("./lib/loader.php");

// connecting to database
$db = new mysql(DB_HOST, '', DB_USER, DB_PASSWORD, DB_NAME); 

// get settings
$settings = SQLSelect('SELECT NAME, VALUE FROM settings');
$total    = count($settings);

for ($i = 0; $i < $total; $i ++)
   Define('SETTINGS_' . $settings[$i]['NAME'], $settings[$i]['VALUE']);

// language selection by settings
if (SETTINGS_SITE_LANGUAGE && file_exists(ROOT . 'languages/' . SETTINGS_SITE_LANGUAGE . '.php')) 
   include_once (ROOT . 'languages/' . SETTINGS_SITE_LANGUAGE . '.php');

include_once (ROOT . 'languages/default.php');

if (defined('SETTINGS_SITE_TIMEZONE')) 
{
   ini_set('date.timezone', SETTINGS_SITE_TIMEZONE);
}

header ('Content-Type: text/html; charset=utf-8');

/*
include_once('./modules/scripts/scripts.class.php');
$sc=new scripts();
$sc->checkScheduledScripts();
*/

$urls=array(
'http://demo.smartliving.ru/scripts/cycle_main.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_states.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_execs.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_scheduler.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_ping.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_webvars.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_watchfolders.php?onetime=1', 
'http://demo.smartliving.ru/scripts/cycle_rss.php?onetime=1'
);

$total=count($urls);
for($i=0;$i<$total;$i++) {
 echo getURL($urls[$i])."<hr>";
}

// closing database connection
$db->Disconnect(); 

?>