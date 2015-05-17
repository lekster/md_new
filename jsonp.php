<?
/*
* Автор Казаков Сергей
* на форуме под ником Bagir
* благодарность denis на примеры
* ver 1.3
*/

 include_once("./config.php");
 include_once("./lib/loader.php");
 $session=new session("prj");
 $db=new mysql(DB_HOST, '', DB_USER, DB_PASSWORD, DB_NAME); // connecting to database
 include_once("./load_settings.php");
 if (!headers_sent()) {
  header ("HTTP/1.0: 200 OK\n");
  header ('Content-Type: text/html; charset=utf-8');
 }


 // Получить имя и проверить
 if ( isset($params['name'])  ) { $name = $params['name']; } else { returm; }

 // Разбить на объект и свойство (возможен вариант поиска в pvalues сразу по PROPERTY_NAME=$name не разбирая на объект и свойство)
 $name = explode('.', $name);

 // Получить объект по имени
 $obj=getObject($name[0]); 
 // Получить id свойства
 $prop_id=$obj->getPropertyByName($name[1], $obj->class_id, $obj->id);
 // Получаем VALUE_ID для следующей таблицы
 $pvalue=SQLSelectOne("SELECT * FROM pvalues WHERE PROPERTY_ID='".$prop_id."' AND OBJECT_ID='".$obj->id."'");
 // Получаем таблицу
 $arr_s = SQLSelect("SELECT UNIX_TIMESTAMP(ADDED) as ADDED, VALUE FROM phistory WHERE VALUE_ID='".$pvalue['ID']."' ORDER BY ADDED");

 /* Вариант с подзапросом. Но тут потом не сделать проверку. Отказался.
 s='SELECT * FROM phistory WHERE VALUE_ID=('
 s.='SELECT ID FROM pvalues WHERE PROPERTY_NAME='Объект.Свойство'
 s.=')'
 */


 // Собрать структуру JSON
 $st ='';
 $st .= $callback.'(';
 $st .= '['.chr(0x0D).chr(0x0A);
 foreach($arr_s as $s){
   if ($f) { $st .=','.chr(0x0D).chr(0x0A); }
   $st .= '['.$s['ADDED'].'000,'.$s['VALUE'].']' ;
   $f=1;
 }
 $st .= ']';
 $st .= ');';


 // Ответ
 header('Content-Type: text/javascript');
 echo ($st);


 $session->save();
 $db->Disconnect(); // closing database connection
?>