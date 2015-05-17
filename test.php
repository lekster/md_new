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

$address='192.168.0.47';
$service_port='7999';
$in='hi';

$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
if ($socket === false) {
    echo "socket_create() failed: reason: " . socket_strerror(socket_last_error()) . "<br/>\n";
    return 0;
}
$result = socket_connect($socket, $address, $service_port);
if ($result === false) {
    echo "socket_connect() failed.\nReason: ($result) " . socket_strerror(socket_last_error($socket)) . "\n";
    return 0;
}
socket_write($socket, $in, strlen($in));
socket_close($socket);



//registerError('custom', 'Some error details');
//$tmp=SQLSelect("SELECT FROM unknown");

// closing database connection
$db->Disconnect(); 

?>