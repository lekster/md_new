<?php

/**
 * ��������� ��� ������ � ��������� im_Platform.
 * ��������� ������������� ������ �� ������ �� ���� ��������� ������� ��������� im_Platform, ����� ���: ������ ������� (<b>����</b>), �������� ������� (<b>��������</b>) � ����� ������� (<b>�����</b>). 
 * <br><br><b>����</b><br>
 * ������ ��� ���������, ��������� �������������. ��� ����� ���� SMS ��� STK ������, ��� ����� ��� ������� ���������. ��� ������ ���� ������� ������������ ����� <b>get</b>. ��� ����������, ����� ���������� ���������� ����. ���� ���� ������� HTTP QUERY_STRING, �� ���������� ������������� ����������� �� ����� ����� � ��������. ��� ������� � ���, ���������� ���������� ����� ����� � ����� <b>get</b>. 
 * <br><br><b>��������</b><br>
 * ���� ������ � �������, ����� ��� ����� �������� (user-id), ������������� ������� (service-id) � ������ ������ (��. ������). ��� ������� � ��� ������������ ����� <b>getParam</b>. 
 * <br><br><b>�����</b><br>
 * ���� ������ ���� = ��������, ��������� ��� ����������� �������. ����� ���������� � ������� ��� �������� � ��������� <b>opt_</b>. ��� ������� � �����, ������������ ����� <b>getOption</b>, ��� ������ �������� �� ���� ������������ ������� ��� �������� ����� �����.
 * 
 * <code>
 * $request = new ImPlatformClient_Request();
 * $msg = $request->get();
 * $msgParam = $request->get('s');
 * $param = $request->getParam('user-id');
 * $option = $request->getOption('conf');
 * $option = $request->getParam('opt_conf');
 * </code>
 * 
 * @link http://intranet.immo/imwiki/ImPlatform?v=12cn im_Platform
 * @link http://intranet.immo/imwiki/ImPlatform?v=12cn#h33-20 ������ ������� im_Platform
 * @version 2.0.0
 * @copyright Inform-mobil 2007
 * @author vadim
 */
class ImPlatformClient_Request
{
    protected $param = array();
    protected $option = array();
    protected $msg = array();
    
    /**
     * �����������.
     * ��������� ������ �� ���������, ����� � ���� �������.
     */
    public function __construct()
    {
        foreach ($_REQUEST as $key => $value) {
            if (strstr($key, 'opt_')) {
                $this->option[substr($key, 4)] = $value;
            }
            $this->param[$key] = $value;
        }
        
        if (isset($_REQUEST['msg'])) {
        	parse_str($_REQUEST['msg'], $this->msg);
        }
    }
        
    /**
     * ���������� ���� ������� ��� ��� ��������.
     * ���� ���������� ��� �������� msg �������. ���� ����� �������� ��������� - �� �������� �������� <b>name</b>, � ����� ��� ���������� �� HTTP QUERY_STRING, ������ �������� <b>name</b>, ��� ��� ����������. ���� ��������� ���������� �� ����������, ������������ NULL;
     * 
     * <code>
     * //���� (?id4=test&s=p)
     * echo $request->get()."\n"; //?id4=test&s=p
     * echo $request->get('?id4')."\n"; //test
     * echo $request->get('s')."\n"; //p
     * echo $request->get('p')."\n"; //NULL
     * </code>
     * 
     * @param string $name ��� ���������� � QUERY_STRING ���� �������
     * @return string 
     */
    public function get($name = false)
    {
        if ($name) {
            return isset($this->msg[$name]) ?  $this->msg[$name] : NULL;
        } else {
            return $this->param['msg'];
        }
    }
    
    public function set($name, $value)
    {
    	$this->msg[$name] = $value;
    }
    
    /**
     * ���������� ���� ������� � ���� �������������� �������.
     * 
     * @return array
     */
    public function getMsg()
    {
        return $this->msg;
    }
    
    /**
     * ���������� �������� �������.
     * ���� �������� �����������, ������������ NULL.
     * 
     * @param string $name ��� ���������
     * @return string
     */
    public function getParam($name)
    {
        return isset($this->param[$name]) ?  $this->param[$name] : NULL;
    }
    
    /**
     * ������������� �������� �������.
     * 
     * @param string $name
     * @param string $value
     * @return void 
     */
    public function setParam($name, $value)
    {
        $this->param[$name] = $value;
    }
    
    /**
     * ���������� ��� ��������� �������.
     * 
     * @return array ������������� ������ ����������
     */
    public function getParams()
    {
        return $this->param;
    }
    
    /**
     * ���������� ����� �������.
     * ���� ����� �����������, ������������ NULL.
     * 
     * @param string $name ��� �����
     * @return string 
     */
    public function getOption($name)
    {
        return isset($this->option[$name]) ?  $this->option[$name] : NULL;
    }
    
    /**
     * ���������� ��� ����� �������.
     * 
     * @return array ������������� ������ �����
     */
    public function getOptions()
    {
        return $this->option;
    }
}

