<?php

require_once 'pbr-lib-common/src/Transporter/src/Exception.php';
require_once 'pbr-lib-common/src/Transporter/src/Request.php';
require_once 'pbr-lib-common/src/Transporter/src/Response.php';
require_once 'pbr-lib-common/src/Transporter/src/Section.php';

class Pbr_Transporter_PlatformSms
{
	protected $callbackUrl;
	protected $contentType;
	protected $pushUrl;

	protected $billIn;
	protected $billOut;
	protected $serviceId;
	protected $registeredDelivery;
	protected $additionalHeaders;

	public function __construct($pushUrl, $callbackUrl = null, $contentType = 'text/plain')
	{
		$this->callbackUrl = $callbackUrl;
		$this->contentType = $contentType;
		$this->pushUrl = $pushUrl;
	}

	public function getCallbackUrl()
	{
		return $this->callbackUrl;
	}

	public function setCallbackUrl($val)
	{
		$this->callbackUrl = $val;
	}

	public function init($billIn = null, $billOut = null, $serviceId = null, $registeredDelivery = null, $additionalHeaders = null)
	{
		$this->billIn = $billIn;
		$this->billOut = $billOut;
		$this->serviceId = $serviceId;
		$this->registeredDelivery = $registeredDelivery;
		$this->additionalHeaders = $additionalHeaders;
	}

	public function send($destanation, $msg, $alphaNum, $smsId, $billIn = null, $billOut = null, $serviceId = null, $registeredDelivery = null, $additionalHeaders = null )
	{

		$billIn = is_null($billIn) ? $this->billIn : $billIn;
		$billOut = is_null($billOut) ? $this->billOut : $billOut;
		$serviceId = is_null($serviceId) ? $this->serviceId : $serviceId;
		$registeredDelivery = is_null($registeredDelivery) ? $this->registeredDelivery : $registeredDelivery;
		$additionalHeaders = is_null($additionalHeaders) ? $this->additionalHeaders : $additionalHeaders;


		$msg = iconv('utf-8', 'cp1251', $msg);
		$response = new \ImPlatformClient_Response();
		$response->setPushUrl($this->pushUrl);
		$response->setPushProxyHost(null);

		$section = $response->addSection(\ImPlatformClient_Section::createNotice($msg));
		$section->setBill($billIn, $billOut);
		$section->setPlug($alphaNum);
		$section->setServiceId($serviceId);
		$section->setDestination($destanation);
		$section->setContentType($this->contentType);
		$section->setHeader('registered-delivery', $registeredDelivery ? 'yes' : 'no');
		if (@is_array($additionalHeaders))
		{
		    foreach ($additionalHeaders as $addHeaderKey => $addHeaderVal)
		    {
		        $section->setHeader($addHeaderKey, $addHeaderVal);
		    }
		}
		
		if(!empty($this->callbackUrl))
		{
			//$logger->info('REQUESTING FOR CALLBACK TO '.$callbackUrl);
			$section->setHeader('callback-url', $this->callbackUrl);
			$section->setHeader('sms-id', $smsId);
		}
		
//		var_export($response);

		try 
		{
			$result = $response->checkable_push($method = \ImPlatformClient_Response::POST);
		} catch (Exception $e) 
		{
//			var_dump($e);
		}

		return $result;
		
	}

}
