<?php
/**
 * Immo_MobileCommerce_SendSmsHelper - класс для отправки смс через мобильную коммерцию
 */

require_once 'pbr-lib-common/src/Caller/class.Caller.php';
require_once 'pbr-lib-common/src/Helper/UUIDGenerator.php';

class Immo_MobileCommerce_SendSmsHelper
{
    protected $config;
    protected $logger;

    public function __construct($config, $logger)
    {
        $this->config = $config;
        $this->logger = $logger;
    }

    public function sendSmsToMc($productName, $password, $msisdn, $sum, $msg)
    {
        if(!$productName || !$password || !$msisdn || !$msg)
        {
            $this->logger->error('NO REQUIRED PARAMS IN METHOD sendSmsToMc');
            return false;
        }

        $mcBaseUrl = $this->config->get('McBaseUrl', 'Global');

        if(!$mcBaseUrl)
            $this->logger->error('NO McBaseUrl IN CONFIG FILE');

        $params = array
        (
            'login' => $productName,
            'password' => $password,
            'msisdn' => $msisdn,
            'transaction_guid' => UUIDGenerator::v4(),
            'sum' => $sum,
            'msg' => urlencode($msg),
        );
        
        $mcUrl = $mcBaseUrl;

        foreach($params as $param => $val)
        {
            $mcUrl = str_replace("%{$param}%", $val, $mcUrl);
        }

        $this->logger->info("CALL MC URL", $mcUrl);

        $caller = new \Caller($mcBaseUrl);
        $ret = $caller->call($params);
        $this->logger->info("RETURN|" . trim($ret));

        if($params['transaction_guid'] == $ret)
        {
            return true;
        }

        return false;
    }
}