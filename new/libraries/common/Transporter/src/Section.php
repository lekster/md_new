<?php




/**
 * Секция ответа im_Platform.
 * Служит для построения одного ответа платформе - СЕКЦИИ. Для создания секций используются фабричные create методы.
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
     * Конструктор.
     * Создает экземпляр секции и устанавливает поля секции по умолчанию:
     * 1. service-id - значение из запроса
     * 2. content-type - text/plain
     * 3. bill-incoming - platform-req
     * 4. bill-outgoing - platform-res
     * 
     * @param int $status идентификатор статуса секции
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
     * Создает notice секцию.
     * Параметры по умолчанию - см. конструктор. Если указан аргумент data, устанавливается тело ответа.
     * 
     * @param string $data тело ответа
     * @return ImPlatformClient_Section
     */
    public static function createNotice($data = false)
    {
        return new ImPlatformClient_Section(0, $data);
    }
    
    /**
     * Создает bubble секцию.
     * Параметры по умолчанию - см. конструктор.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubble()
    {
        return new ImPlatformClient_Section(1);
    }
    
    /**
     * Создает bubble-rewrite секцию.
     * Параметры по умолчанию - см. конструктор. Если указан аргумент data, устанавливается тело ответа.
     * 
     * @param string $data тело ответа
     * @return ImPlatformClient_Section
     */
    public static function createBubbleRewrite($data = false)
    {
        return new ImPlatformClient_Section(2, $data);
    }
    
    /**
     * Создает delay секцию.
     * Параметры по умолчанию - см. конструктор.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createDelay()
    {
        return new ImPlatformClient_Section(3);
    }
    
    /**
     * Создает skip секцию.
     * Параметры по умолчанию - см. конструктор.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createSkip()
    {
        return new ImPlatformClient_Section(4);
    }
    
    /**
     * Создает bubble, notice секцию.
     * Параметры по умолчанию - см. конструктор.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubbleNotice($data = false)
    {
        return new ImPlatformClient_Section(5, $data);
    }
    
    /**
     * Создает bubble, delay секцию.
     * Параметры по умолчанию - см. конструктор.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubbleDelay()
    {
        return new ImPlatformClient_Section(6);
    }
    
    /**
     * Создает bubble, skip секцию.
     * Параметры по умолчанию - см. конструктор.
     * 
     * @return ImPlatformClient_Section
     */
    public static function createBubbleSkip()
    {
        return new ImPlatformClient_Section(7);
    }
    
    /**
     * Устанавливает заголовок секции.
     * 
     * @param string $name имя заголовка
     * @param string $value значение заголовка
     * @return void 
     */
    public function setHeader($name, $value)
    {
        $this->header[$name] = $value;
    }
    
    /**
     * Устанавливает заголовок - идентификатор сервиса.
     * 
     * @param string $service_id
     * @return void 
     */
    public function setServiceId($service_id)
    {
        $this->header['service-id'] = $service_id;
    }
    
    /**
     * Устанавливает заголовок - плаг.
     * 
     * @param string $plug
     * @return void 
     */
    public function setPlug($plug)
    {
        $this->header['plug'] = $plug;
    }
    
	/**
     * Устанавливает заголовок - приоритет.
     * 
     * @param integer $priority
     * @return void 
     */
    public function setPriority($priority)
    {
        $this->header['priority'] = $priority;
    }
    
    /**
     * В ответе от платформы просим указать id по которому потом сможем отследить
     * статус сообщения.
     * Используется только в Response->checkable_push()
     * 
     * Соответствующее поле в sender_smpp.sms_problem и sender_smpp.sms_done:
     * smsc_id
     */
    public function setNeedResponseId()
    {
        $this->header['response-id'] = 1;
    }
    
    /**
     * Возвращает значение залоговка response-id.
     * Ключ, по которому можно отследить статус сообщения
     * 
     * @see $this->setNeedResponseId()
     * @return string 
     */
    public function getResponseId()
    {
        return $this->getHeader('response-id');
    }
    
    /**
     * Устанавливает заголовоки - входной и выходной биллкоды.
     * 
     * @param string $incoming входной биллкод
     * @param string $outgoing выходной биллкод
     * @return void 
     */
    public function setBill($incoming, $outgoing)
    {
        $this->header['bill-incoming'] = $incoming;
        $this->header['bill-outgoing'] = $outgoing;
    }
    
    /**
     * Устанавливает заголовок - тип контента.
     * 
     * @param string $contentType
     * @return void 
     */
    public function setContentType($contentType)
    {
        $this->header['content-type'] = $contentType;
    }
    
    /**
     * Устанавливает заголовок - адрес назначения.
     * 
     * @param string $dest
     * @return void 
     */
    public function setDestination($dest)
    {
        $this->header['destination'] = $dest;
    }
    
    /**
     * Устанавливает заголовок - время доставки сообщения абоненту.
     * 
     * @param string $defDelivery - дата в формате YYYY-MM-DD hh:mm:ss
     * @return void
     */
    public function setDefDelivery($defDelivery)
    {
    	$this->header['def-delivery'] = $defDelivery;
    }
    
    /**
     * Устанавливает задержку отправки ответа абоненту в секундах.
     * 
     * @param string $sec
     * @return void
     */
    public function setDefDeliveryDelay($sec)
    {
    	$this->setDefDelivery(date("Y-m-d H:i:s", time() + $sec));
    }
    
    /**
     * Метод устанавливает URL, на который будет отправлено подтверждение о доставке смс.
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
     * Устанавливает тело ответа секции.
     * 
     * @param string $data
     * @return void 
     */
    public function setData($data)
    {
        $this->data = $data;
    }
    
    /**
     * Возвращает значение залоговка секции.
     * Если заголовка нет, возвращается NULL.
     * 
     * @param string $name имя заголовка
     * @return string 
     */
    public function getHeader($name)
    {
        return isset($this->header[$name]) ? $this->header[$name] : NULL;
    }
    
    /**
     * Возвращает залоговки секции.
     * 
     * @return array
     */
    public function getHeaders()
    {
        return $this->header;
    }
    
    /**
     * Возвращает значение залоговка - идентификатор сервиса.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getServiceId()
    {
        return isset($this->header['service-id']) ? $this->header['service-id'] : NULL;
    }
    
    /**
     * Возвращает значение залоговка - плаг.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getPlug()
    {
        return isset($this->header['plug']) ? $this->header['plug'] : NULL;
    }
    
	/**
     * Возвращает значение залоговка - приоритет.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return integer 
     */
    public function getPriority()
    {
        return isset($this->header['priority']) ? $this->header['priority'] : NULL;
    }
    
    /**
     * Возвращает значение залоговка - входной биллкод.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getBillIncoming()
    {
        return isset($this->header['bill-incoming']) ? $this->header['bill-incoming'] : NULL;
    }
    
    /**
     * Возвращает значение залоговка - выходной биллкод.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getBillOutgoing()
    {
        return isset($this->header['bill-outgoing']) ? $this->header['bill-outgoing'] : NULL;
    }
    
    /**
     * Возвращает значение залоговка - тип контента.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getContentType()
    {
        return isset($this->header['content-type']) ? $this->header['content-type'] : NULL;
    }
    
    /**
     * Возвращает значение залоговка - адрес назначения.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getDestination()
    {
        return isset($this->header['destination']) ? $this->header['destination'] : NULL;
    }
    
    /**
     * Возвращает значение залоговка - время доставки сообщения абоненту.
     * Если заголовка нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getDefDelivery()
    {
        return isset($this->header['def-delivery']) ? $this->header['def-delivery'] : NULL;
    }
    
    /**
     * Возвращает статус секции.
     * 
     * @return string 
     */
    public function getStatus()
    {
        return $this->header['status'];
    }
    
    /**
     * Возвращает тело ответа секции.
     * Если тела нет, возвращается NULL.
     * 
     * @return string 
     */
    public function getData()
    {
        return $this->data ? $this->data : NULL;
    }
    
    /**
     * Выводит заголовки секции.
     * 
     * По умолчанию, заголовки секции выводятся в виде HTTP заголовков. Если параметр $asHttpHeader установить в false, вывод попадет в стандартный поток вывода.
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
     * Выводит секцию.
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
     * Возвращает отформатированную секцию.
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

