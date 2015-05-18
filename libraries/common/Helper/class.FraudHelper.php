<?php

require_once 'pbr-lib-common/src/Caller/class.Caller.php';

class Immo_MobileCommerce_FraudHelper
{
    protected $_fraudUrl;

    protected $_logger;
    protected $_config;

    public function __construct($fraudUrl)
    {
        $this->_config = Immo_MobileCommerce_ServiceLocator::getInstance()->getConfig();
        $this->_logger = Immo_MobileCommerce_ServiceLocator::getInstance()->getLogger();

        $this->_fraudUrl = $fraudUrl;
    }

    public function addInBlackList($fraudListName, $msisdn)
    {
        $fraudReqUrl = $this->_fraudUrl;
        $data = array(
            'service_name' => $fraudListName,
            'request_data' => $msisdn
        );
        $caller = new \Caller($fraudReqUrl);
        $caller->setPost(json_encode($data), 'application/json');
        $ret = $caller->call(array(), true);

        if($ret)
        {
            $resp = json_decode($ret,true);
            return $resp['status'] == 'true';
        }
        return null;
    }

    public function deleteFromBlackList($fraudListName, $msisdn)
    {

        $fraudReqUrl = $this->_fraudUrl.$fraudListName.'?request=%msisdn%';
        $params = array('msisdn' => $msisdn);
        $caller = new \Caller($fraudReqUrl);
        $ret = $caller->call($params, false, "DELETE");

        if($ret)
        {
            $resp = json_decode($ret,true);
            return $resp['success'] == 'true';
        }
        return null;
    }

    public function checkBlackList($fraudListName, $msisdn)
    {
        $fraudReqUrl = $this->_fraudUrl.$fraudListName.'/'.$msisdn;

        $caller = new \Caller($fraudReqUrl);
        $ret = $caller->call();

        if($ret)
        {
            $resp = json_decode($ret, true);
            if($resp['ResponseCode'] == 1)
            {
                return true;
            }
            elseif($resp['ResponseCode'] == 0)
            {
                return false;
            }
        }
        return null;
    }
}