<?php




/**
 * ������ ������ im_Platform.
 * ������ ��� ���������� ������ ������ ��������� - ������. ��� �������� ������ ������������ ��������� create ������.
 * 
 * <code>
 * $notice = ImPlatformClient_Section::createNotice('sms text');
 * $notice->setBill('in', 'out');
 * echo $notice."\n\n\n";
 * 
 * echo ImPlatformClient_Section::createBubble();
 * </code>
 * 
 * @link http://intranet.immo/imwiki/ImPlatform?v=12cn im_Platform
 * @version 2.0.0
 * @copyright Inform-mobil 2007
 * @author vadim
 */
class ImPlatformClient_Section
{
    private $statusList = array(
        'notice',
        'bubble',
        'bubble-rewrite',
        'delay',
        'skip',
        'bubble, notice',
        'bubble, delay',
        'bubble, skip'
    );
    
    private $header = array();
    private $data = false;
    
    /**
     * �����������.
     * ������� ��������� ������ � ������������� ���� ������ �� ���������:
     * 1. service-id - �������� �� �������
     * 2. content-type - text/plain
     * 3. bill-incoming - platform-req
     * 4. bill-outgoing - platform-res
     * 
     * @param int $status ������������� ������� ������
     */
    protected function __construct($status, $data = false)
    {
        $this->header['status'] = $this->statusList[$status];
        
        $this->setServiceId(isset($_REQUEST['service-id']) ?  $_REQUEST['service-id'] : NULL);
        $this->setContentType('text/plain');
        $this->setBill('platform-req', 'platform-res');
        
        if ($data) {
            $this->setData($data);
        }
    }
    
    /**
     * ������� notice ������.
     * ��������� �� ��������� - ��. �����������. ���� ������ �������� data, ��������������� ���� ������.
     * 
     * @param string $data ���� ������
     * @return ImPlatformClient_Section
     */
    public static function createNotice($data = false)
    {
        return new ImPlatformClient_Section(0, $data);
    }
    
    /**
     * ������� bubble ������.
     * ��������� �� ��������� - ��. �����������.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubble()
    {
        return new ImPlatformClient_Section(1);
    }
    
    /**
     * ������� bubble-rewrite ������.
     * ��������� �� ��������� - ��. �����������. ���� ������ �������� data, ��������������� ���� ������.
     * 
     * @param string $data ���� ������
     * @return ImPlatformClient_Section
     */
    public static function createBubbleRewrite($data = false)
    {
        return new ImPlatformClient_Section(2, $data);
    }
    
    /**
     * ������� delay ������.
     * ��������� �� ��������� - ��. �����������.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createDelay()
    {
        return new ImPlatformClient_Section(3);
    }
    
    /**
     * ������� skip ������.
     * ��������� �� ��������� - ��. �����������.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createSkip()
    {
        return new ImPlatformClient_Section(4);
    }
    
    /**
     * ������� bubble, notice ������.
     * ��������� �� ��������� - ��. �����������.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubbleNotice($data = false)
    {
        return new ImPlatformClient_Section(5, $data);
    }
    
    /**
     * ������� bubble, delay ������.
     * ��������� �� ��������� - ��. �����������.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubbleDelay()
    {
        return new ImPlatformClient_Section(6);
    }
    
    /**
     * ������� bubble, skip ������.
     * ��������� �� ��������� - ��. �����������.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubbleSkip()
    {
        return new ImPlatformClient_Section(7);
    }
    
    /**
     * ������������� ��������� ������.
     * 
     * @param string $name ��� ���������
     * @param string $value �������� ���������
     * @return void 
     */
    public function setHeader($name, $value)
    {
        $this->header[$name] = $value;
    }
    
    /**
     * ������������� ��������� - ������������� �������.
     * 
     * @param string $service_id
     * @return void 
     */
    public function setServiceId($service_id)
    {
        $this->header['service-id'] = $service_id;
    }
    
    /**
     * ������������� ��������� - ����.
     * 
     * @param string $plug
     * @return void 
     */
    public function setPlug($plug)
    {
        $this->header['plug'] = $plug;
    }
    
	/**
     * ������������� ��������� - ���������.
     * 
     * @param integer $priority
     * @return void 
     */
    public function setPriority($priority)
    {
        $this->header['priority'] = $priority;
    }
    
    /**
     * � ������ �� ��������� ������ ������� id �� �������� ����� ������ ���������
     * ������ ���������.
     * ������������ ������ � Response->checkable_push()
     * 
     * ��������������� ���� � sender_smpp.sms_problem � sender_smpp.sms_done:
     * smsc_id
     */
    public function setNeedResponseId()
    {
        $this->header['response-id'] = 1;
    }
    
    /**
     * ���������� �������� ��������� response-id.
     * ����, �� �������� ����� ��������� ������ ���������
     * 
     * @see $this->setNeedResponseId()
     * @return string 
     */
    public function getResponseId()
    {
        return $this->getHeader('response-id');
    }
    
    /**
     * ������������� ���������� - ������� � �������� ��������.
     * 
     * @param string $incoming ������� �������
     * @param string $outgoing �������� �������
     * @return void 
     */
    public function setBill($incoming, $outgoing)
    {
        $this->header['bill-incoming'] = $incoming;
        $this->header['bill-outgoing'] = $outgoing;
    }
    
    /**
     * ������������� ��������� - ��� ��������.
     * 
     * @param string $contentType
     * @return void 
     */
    public function setContentType($contentType)
    {
        $this->header['content-type'] = $contentType;
    }
    
    /**
     * ������������� ��������� - ����� ����������.
     * 
     * @param string $dest
     * @return void 
     */
    public function setDestination($dest)
    {
        $this->header['destination'] = $dest;
    }
    
    /**
     * ������������� ��������� - ����� �������� ��������� ��������.
     * 
     * @param string $defDelivery - ���� � ������� YYYY-MM-DD hh:mm:ss
     * @return void
     */
    public function setDefDelivery($defDelivery)
    {
    	$this->header['def-delivery'] = $defDelivery;
    }
    
    /**
     * ������������� �������� �������� ������ �������� � ��������.
     * 
     * @param string $sec
     * @return void
     */
    public function setDefDeliveryDelay($sec)
    {
    	$this->setDefDelivery(date("Y-m-d H:i:s", time() + $sec));
    }
    
    /**
     * ����� ������������� URL, �� ������� ����� ���������� ������������� � �������� ���.
     *
     * @param string $url
     * @param int $smsId
     */
    public function setDeliveryCallbackUrl($url, $smsId)
    {
        $this->header['callback-url'] = $url;
        $this->header['sms-id'] = $smsId;
    }
    
    /**
     * ������������� ���� ������ ������.
     * 
     * @param string $data
     * @return void 
     */
    public function setData($data)
    {
        $this->data = $data;
    }
    
    /**
     * ���������� �������� ��������� ������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @param string $name ��� ���������
     * @return string 
     */
    public function getHeader($name)
    {
        return isset($this->header[$name]) ? $this->header[$name] : NULL;
    }
    
    /**
     * ���������� ��������� ������.
     * 
     * @return array
     */
    public function getHeaders()
    {
        return $this->header;
    }
    
    /**
     * ���������� �������� ��������� - ������������� �������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getServiceId()
    {
        return isset($this->header['service-id']) ? $this->header['service-id'] : NULL;
    }
    
    /**
     * ���������� �������� ��������� - ����.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getPlug()
    {
        return isset($this->header['plug']) ? $this->header['plug'] : NULL;
    }
    
	/**
     * ���������� �������� ��������� - ���������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return integer 
     */
    public function getPriority()
    {
        return isset($this->header['priority']) ? $this->header['priority'] : NULL;
    }
    
    /**
     * ���������� �������� ��������� - ������� �������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getBillIncoming()
    {
        return isset($this->header['bill-incoming']) ? $this->header['bill-incoming'] : NULL;
    }
    
    /**
     * ���������� �������� ��������� - �������� �������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getBillOutgoing()
    {
        return isset($this->header['bill-outgoing']) ? $this->header['bill-outgoing'] : NULL;
    }
    
    /**
     * ���������� �������� ��������� - ��� ��������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getContentType()
    {
        return isset($this->header['content-type']) ? $this->header['content-type'] : NULL;
    }
    
    /**
     * ���������� �������� ��������� - ����� ����������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getDestination()
    {
        return isset($this->header['destination']) ? $this->header['destination'] : NULL;
    }
    
    /**
     * ���������� �������� ��������� - ����� �������� ��������� ��������.
     * ���� ��������� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getDefDelivery()
    {
        return isset($this->header['def-delivery']) ? $this->header['def-delivery'] : NULL;
    }
    
    /**
     * ���������� ������ ������.
     * 
     * @return string 
     */
    public function getStatus()
    {
        return $this->header['status'];
    }
    
    /**
     * ���������� ���� ������ ������.
     * ���� ���� ���, ������������ NULL.
     * 
     * @return string 
     */
    public function getData()
    {
        return $this->data ? $this->data : NULL;
    }
    
    /**
     * ������� ��������� ������.
     * 
     * �� ���������, ��������� ������ ��������� � ���� HTTP ����������. ���� �������� $asHttpHeader ���������� � false, ����� ������� � ����������� ����� ������.
     *
     * @return void 
     */
    public function flushHeaders($asHttpHeader = true)
    {
    	if ($asHttpHeader) {
	        foreach ($this->header as $name => $value) {
	            header($name.': '.$value);
	        }
	    } else {
	    	$br = '';
	    	foreach ($this->header as $name => $value) {
	            echo $br.$name.': '.$value;
	            $br = "\n";
	        }
	    }
    }
    
    /**
     * ������� ������.
     * 
     * @return void 
     */
    public function flush()
    {
        echo $this->flushHeaders(false)."\n\n".$this->getData();
    }
    
    
    public function unsetHeader($name)
    {
    	if (isset($this->header[$name]))
    		unset($this->header[$name]);
    		
    	return true;
    }
    
    /**
     * ���������� ����������������� ������.
     * 
     * @return string 
     */
    public function toString()
    {
        return $this->__toString();
    }
    
    public function __toString()
    {
        $header = array();
        foreach ($this->header as $key => $value) {
            $header[] = $key.': '.$value;
        }
        
        return implode("\n", $header)."\n\n".$this->getData();
    }
}

