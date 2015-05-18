<?php




/**
 * ��������� ��� ������ � ���������� �������� im_Platform.
 * ��������� ����� ��������� ������� �� ������. ��������� ������������ ��������� ������. ����� ��������� ��� PULL, ��� � PUSH �������� ��� ��������.
 * <br>
 * <br> 
 * <b>����� PULL</b>
 * <code>
 * $response = new ImPlatformClient_Response();
 * $notice = $response->addSection(ImPlatformClient_Section::createNotice('sms pull'));
 * $notice->setBill('in', 'out');
 * //Native PULL - outs meta and body as data
 * $response->pull();
 * //Manual PULL - outs some metas as headers and body as data
 * header('content-type: '.$response->getSection(0)->getContentType());
 * echo $response;
 * </code>
 * 
 * <b>����� PUSH</b><br>
 * �� ��������� ��� PUSH �������� ������������ ���������:
 * 1. Push RPC URL: <b>http://platform.immo.ru/rpc/push/</b>
 * 2. Push Proxy Host: <b>192.168.2.247</b>
 * 3. Push Proxy Port: <b>80</b>
 * 4. Push timeout: <b>��������</b>
 * <br>
 * <code>
 * $response = new ImPlatformClient_Response();
 * $notice = $response->addSection(ImPlatformClient_Section::createNotice('sms push'));
 * $notice->setBill('in', 'out');
 * try {
 *  $res = $response->push();
 * } catch (ImPlatformClient_Exception $e) {
 *  die($e->getMessage()."\n");
 * }
 * print_r($res);
 * </code>
 * 
 * 
 * @link http://intranet.immo/imwiki/ImPlatform?v=12cn im_Platform
 * @version 2.0.0
 * @copyright Inform-mobil 2007
 * @author vadim
 */
class ImPlatformClient_Response
{
    const POST = 'POST';
    const GET = 'GET';
    
    private $pushUrl = 'http://platform.immo.ru/rpc/push/';
    private $pushProxyHost = '192.168.2.247';
    private $pushProxyPort = 80;
    private $pushTimeout = 0;
    
    private $section = array();
    
    /**
     * �����������.
     * ������� ������ ������ ������.
     */

    
    /**
     * ������������� URL ��� PUSH ��������.
     * 
     * @param string $url 
     * @return void 
     */
    public function setPushUrl($url)
    {
        $this->pushUrl = $url;
    }
    
    /**
     * ������������� ���� ������-�������.
     * ���� �������� host = FALSE, ������ ����� ������-������ �����������.
     * 
     * @param string $host 
     * @return void 
     */
    public function setPushProxyHost($host)
    {
        $this->pushProxyHost = $host;
    }
    
    /**
     * ������������� ���� ������-�������.
     * 
     * @param int $port 
     * @return void 
     */
    public function setPushProxyPort($port)
    {
        $this->pushProxyPort = (int) $port;
    }
    
    /**
     * ������������� timeout ��� PUSH ��������.
     * 
     * @param int $timeout 
     * @return void 
     */
    public function setPushTimeout($timeout)
    {
        $this->pushTimeout = (int) $timeout;
    }
    
    /**
     * ��������� ������ � ����� � ���������� ������ �� ���.
     * 
     * @param ImPlatformClient_Section $section 
     * @return ImPlatformClient_Section 
     */
    public function addSection(ImPlatformClient_Section $section)
    {
        $this->section[] = $section;
        
        return $section;
    }
    
    /**
     * ���������� ������ ������.
     * ���� ������ � ��������� ������� ���, ������������ NULL.
     * 
     * @param int $id ����� ������
     * @return ImPlatformClient_Section 
     */
    public function getSection($id)
    {
        if (count($this->section) > (int) $id) {
            return $this->section[(int) $id];
        }
        
        return NULL;
    }
    
    /**
     * ��������� PULL ��������(����� ������) ��� ���� ������ � ������.
     *
     * ���� ������ ���������, ��� ������ � �� ��������� ��������� ����� ����������� ����� ������ � HTTP ���������� <b>content-type = text/plain</b>. ���� ������ ���� � �� <b>content-type</b> ���������� � <b>text/plain</b>, ������ � �� ��������� ��������� � ����������� ����� ������ � HTTP ���������� <b>content-type = text/plain</b>. ���� ������ ���� � �� <b>content-type</b> ������� �� <b>text/plain</b>, ��� ��������� ������ �������� � ���� HTTP ����������, � ������ � ����������� �����.
     *
     * @return void 
     */
    public function pull()
    {
        if ( ($size = $this->size()) == 1 ) {

                if (strchr($this->section[0]->getContentType(), ';'))
                {
            	   list($contentType, $destContentType) = explode(';', $this->section[0]->getContentType());
                } 
                else 
                {
                    $contentType = $this->section[0]->getContentType();
                }
            
	            if ($contentType == 'text/plain') {
	            	header('content-type: '.$contentType);
	            	$this->section[0]->flush();
	            } else {
	            	$this->section[0]->flushHeaders();
	            	echo $this->section[0]->getData();
	            }
	            
        } else {
        	
        	header('content-type: text/plain');
        	
        	for ($i = 0; $i < $size; $i++) {
        		echo ($i ? "\n\n\n" : '');
        		$this->section[$i]->flush();
        	}
        	
        }
    }
    
    /**
     * ��������� PUSH �������� ��� ���� ������ � ������. 
     * � ����������� ������ ������ ��������� �������� response-id ��� ������������ ������� ���������
     * 
     * ������� �� push():
     * ���������� curl ������ ������� (� ��������� ��������� �� ������� �������),
     * ������������ �������� response-id
     * 
     * HTTP ������ �� ���������� �������� ����� ���� ��������� ��� GET, ��� � POST �������. ��� �������� ������ ������������ ���������:
     * 1. ImPlatformClient_Response::GET
     * 2. ImPlatformClient_Response::POST
     * 
     * ����� ���������� ������ ����������� �������� ��� ������ ������, ��� ������� 0 - ��������� ��� ������ ������, 1 ��� ������ � �. �.
     * ��������� ��� ������ - ��� ������������� ������ � ������:
     * 1. code: OK|ERROR
     * 2. comment: �����������, ���� ��� ERROR
     * 3. success: ��������� ����
     * [4. response-id: ����� ���� ��� ������������ ������� � sms_done, sms_problem... �� ����������] 
     * 
     * @param string $method ����� HTTP �������
     * @param int $try ���������� ������� ���������� ��������
     * @throws ImPlatformClient_Exception ���� HTTP ������ �� ����� ���� ��������
     * @return array ������ ����������� �������� ��� ������ ������
     */
    public function checkable_push($method = ImPlatformClient_Response::GET, $try = 1)
    {
        if ($try <= 0) $try = 1;
        
        if ( !count($this->section) ) {
            throw new ImPlatformClient_Exception('no section(s) for push');
        }
        
        if ( !$service_id = $this->section[0]->getServiceId() )
        {
            throw new ImPlatformClient_Exception('service-id missed');
        }
        
		if (!$ch = curl_init())
		{
		    throw new ImPlatformClient_Exception('failed to curl_init()');
		}

		if ($this->pushProxyHost)
		{
		    curl_setopt($ch, CURLOPT_PROXY, $this->pushProxyHost);
		    if (!is_null($this->pushProxyPort))
		    {
                curl_setopt($ch, CURLOPT_PROXYPORT, $this->pushProxyPort);
		    }
		}
		
		if ($this->pushTimeout)
		{
		    curl_setopt($ch, CURLOPT_TIMEOUT, $this->pushTimeout);
		}
		
		$t = $this->toString();
		
		// ��� ������������� ������������������� ��������, � ������ �������� ������ � ������� 
        // ���������� service-id ����� ��������� ������
        //$data = 'service_id='.urlencode($service_id).'&'.'msg='.urlencode($this->toString());
        $data = 'msg='.urlencode($this->toString());

		$query_string = $this->pushUrl;
		
        if ($method == ImPlatformClient_Response::GET) {
            $query_string = $this->pushUrl."?".$data;
        } else {
		    curl_setopt($ch, CURLOPT_POST, 1);
		    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        }		

		curl_setopt($ch, CURLOPT_URL, $query_string);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        
		$result = curl_exec($ch);
		
		if ($result === false)
		{
			throw new ImPlatformClient_Exception('Failed to exec query: '.$query_string. ' Error ('.curl_errno($ch).'): '.curl_error($ch));
			
            while ($try > 0 && !$result) {
                $try--;
                $result = curl_exec($ch);
            }
		}
		
		if ($result === false)	
		{
		    throw new ImPlatformClient_Exception('Failed to exec query: '.$query_string. ' Error ('.curl_errno($ch).'): '.curl_error($ch));
		}
		
		curl_close($ch);

		$unified = str_replace("\r\n", "\n", trim($result));
        $reply = explode("\n\n\n", $unified);		
		
        if (empty($reply))
        {
            throw new ImPlatformClient_Request('Push result is empty');
        }
        
        unset($data, $query_string, $result, $unified);		
        
		$result = array();
		
		foreach ($reply as &$r)
		{
		    $lines = explode("\n",$r);
		    
		    $map = array(
		      'comment' => false,
		      'success' => false
		    );
		    
		    foreach ($lines as &$line)
		    {
		        if (strpos($line,':') !== false)
		        {
		          list($name, $value) = explode(':', $line);
		          $map[trim($name)] = trim($value);
		        }
		    }
		    
		    if (!key_exists('code', $map))
		    {
		        throw new ImPlatformClient_Exception('malformed platform response '. var_export($reply, true));
		    }
		    
            if (strcmp($map['code'], 'OK') == 0)
            {
                $map['success'] = true;
            }		    
		    
		    $result[] = $map;
		}		
		
        if (empty($result))
        {
            throw new ImPlatformClient_Exception('malformed platform response'. var_export($reply, true));
        }
        
        unset($reply);
		
        return $result;
        
    }
    
    /**
     * ��������� PUSH �������� ��� ���� ������ � ������.
     * HTTP ������ �� ���������� �������� ����� ���� ��������� ��� GET, ��� � POST �������. ��� �������� ������ ������������ ���������:
     * 1. ImPlatformClient_Response::GET
     * 2. ImPlatformClient_Response::POST
     * 
     * ����� ���������� ������ ����������� �������� ��� ������ ������, ��� ������� 0 - ��������� ��� ������ ������, 1 ��� ������ � �. �.
     * ��������� ��� ������ - ��� ������������� ������ � ������:
     * 1. code: OK|ERROR
     * 2. comment: �����������, ���� ��� ERROR
     * 3. success: ��������� ����
     * 
     * @param string $method ����� HTTP �������
     * @param int $try ���������� ������� ���������� ��������
     * @throws ImPlatformClient_Exception ���� HTTP ������ �� ����� ���� ��������
     * @return array ������ ����������� �������� ��� ������ ������
     */
    public function push($method = ImPlatformClient_Response::GET, $try = 1)
    {    	
        if ($try <= 0) $try = 1;
        
        if ( !count($this->section) ) {
            throw new ImPlatformClient_Exception('no section(s) for push');
        }
        
        if ( !$service_id = $this->section[0]->getServiceId() )
        {
            throw new ImPlatformClient_Exception('service-id missed');
        }
                    
        /* determining a host */
        if ($this->pushProxyHost) $host = $this->pushProxyHost;
        else $host = $this->getHostFromUrl($this->pushUrl);

        $errno = 0;
        $errstr = '';
		
        while ($try > 0) {
            $try--;
            if ($this->pushTimeout) {
                $fsock = @fsockopen($host, $this->pushProxyPort, $errno, $errstr, $this->pushTimeout);
            } else {
                $fsock = @fsockopen($host, $this->pushProxyPort, $errno, $errstr);
            }
            
            if (!$fsock) {
                sleep(1);
            } else {
                break;
            }
        }

        if (!$fsock) {
            if ($errno == 0) {
                throw new ImPlatformClient_Exception('cannot initialize socket');
            } else {
                throw new ImPlatformClient_Exception($errstr .': '.$errno);
            }
        }
        
        $data = 'service_id='.urlencode($service_id).'&'.'msg='.urlencode($this->toString());

        if ($method == ImPlatformClient_Response::GET) {
            $query_string = "GET ".$this->pushUrl."?".$data." HTTP/1.0\r\n";
        } else {
            $query_string = "POST ".$this->pushUrl." HTTP/1.0\r\n";
            $query_string .= "Content-Length: ".strlen($data)."\r\n";
        }
        $query_string .= "Connection: Close\r\n";		
        $query_string .= "User-Agent: PHP5;platform/common;\r\n";
        if ($method == ImPlatformClient_Response::GET) {
            $query_string .= "\r\n";
        } else {
            $query_string .= "\r\n".$data."\r\n";
        }

        if (!@fputs($fsock, $query_string)) {
            @fclose($fsock);
            throw new ImPlatformClient_Exception('cant write to socket');
        }
        
        $reply = '';
        
        while ( !feof($fsock) ) {
            $reply .= fgets($fsock, 65535);
        }
        
        fclose($fsock);

        $reply = explode("\r\n", $reply);
        
        if (strpos($reply[0], '200') === false) {
            throw new ImPlatformClient_Exception('status fail: '.$reply[0]);
        }
        
        $result = false;
        for ($i = 1; $i < count($reply); $i++) {
            if (strlen($reply[$i]) == 0 && isset($reply[$i + 1])) {
                $result = $reply[$i + 1];
            }
        }
        
        if (!$result) {
            throw new ImPlatformClient_Exception('malformed platform response');
        }

        if ( count($lines = explode("\n", $result)) == 0) {
            throw new ImPlatformClient_Exception('malformed platform response: '.$result);
        }

        $result = array();
        $i = -1;
        foreach ($lines as $value) {
            if (strpos($value, 'code') !== false) {
                $i++;
                $result[$i]['code'] = trim(substr($value, strpos($value, ':') + 1));
                $result[$i]['comment'] = false;
                if ($result[$i]['code'] == 'OK') {
                    $result[$i]['success'] = true;
                } else {
                    $result[$i]['success'] = false;
                }
            } else if (strpos($value, 'comment') !== false) {
                $result[$i]['comment'] = trim(substr($value, strpos($value, ':') + 1));             
            }
        }

        return $result;
    }
    
    /**
     * ���������� ������ ������ � �������.
     * 
     * @return int ���������� ������ � ������
     */
    public function size()
    {
        return count($this->section);
    }
    
    /**
     * ������� ��� ������ ������.
     * 
     * @return void 
     */
    public function clear()
    {
        $this->section = array();
    }
    
    /**
     * ���������� ��������������� ����� � ���� ������.
     * 
     * @return string 
     */
    public function toString()
    {
        return $this->__toString();
    }
    
    public function __toString()
    {
        $str = '';
        
        if (count($this->section)) {
            foreach($this->section as &$section) {
                $str .= $section->toString()."\n\n\n";
            }
        }

        return $str;
    }
    
    /**
     * ���������� ��� ����� �� URL ������.
     * ���� URL ��������, ������������ ����������.
     * 
     * @param string $url
     * @return string
     * @throws ImPlatformClient_Exception ���� URL �� �������� ��� ����� ��� �� ���������
     */
    private function getHostFromUrl($url)
    {
        $pos = strpos($url, 'http://');
        
        if ($pos === false || $pos != 0) {
            throw new ImPlatformClient_Exception('malformed URL: '.$url.', unknown protocol');
        }
        
        $url = substr($url, 7);
        $host = '';
        
        for ($i = 0; $i < strlen($url); $i++) {         
            if ($url[$i] == '/' || $url[$i] == '?') {
                break;
            }
            $host .= $url[$i];
        }
        
        if (strlen($host) == 0) {
            throw new ImPlatformClient_Exception('malformed URL: '.$url.', host is missed');
        }
        
        return $host;
    }

}

