<?
/*
* ����� ������� ������
* �� ������ ��� ����� Bagir
* ������������� denis �� �������
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


 // �������� ��� � ���������
 if ( isset($params['name'])  ) { $name = $params['name']; } else { returm; }

 // ������� �� ������ � �������� (�������� ������� ������ � pvalues ����� �� PROPERTY_NAME=$name �� �������� �� ������ � ��������)
 $name = explode('.', $name);

 // �������� ������ �� �����
 $obj=getObject($name[0]); 
 // �������� id ��������
 $prop_id=$obj->getPropertyByName($name[1], $obj->class_id, $obj->id);
 // �������� VALUE_ID ��� ��������� �������
 $pvalue=SQLSelectOne("SELECT * FROM pvalues WHERE PROPERTY_ID='".$prop_id."' AND OBJECT_ID='".$obj->id."'");
 // �������� �������
 $arr_s = SQLSelect("SELECT UNIX_TIMESTAMP(ADDED) as ADDED, VALUE FROM phistory WHERE VALUE_ID='".$pvalue['ID']."' ORDER BY ADDED");

 /* ������� � �����������. �� ��� ����� �� ������� ��������. ���������.
 s='SELECT * FROM phistory WHERE VALUE_ID=('
 s.='SELECT ID FROM pvalues WHERE PROPERTY_NAME='������.��������'
 s.=')'
 */


 // ������� ��������� JSON
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


 // �����
 header('Content-Type: text/javascript');
 echo ($st);


 $session->save();
 $db->Disconnect(); // closing database connection
?>