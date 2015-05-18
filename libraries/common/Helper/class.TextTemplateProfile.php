<?php

class Pbr_Helper_TextTemplateProfile
{
    protected $templateTokens = array();
    protected $apiUrl;

    public function parseTemplateParams($template, $params)
    {
        foreach($params as $param => $val)
        {
            $template = str_replace("%{$param}%", $val, $template);
        }

        return $template;
    }

    public function __construct($apiUrl)
    {
        $this->apiUrl = $apiUrl;
    }

    public function getTemplateByTextProfileId($textProfileId)
    {
        if (!$textProfileId) throw new Exception('TextProfileId is empty');
        if (!$this->apiUrl) throw new Exception('Not set Global.TextTemplateApiUrl');

        if (!isset($this->templateTokens[$textProfileId]))
        {
            $serviceLocator = Immo_MobileCommerce_ServiceLocator::getInstance();

            $logger = $serviceLocator->getLogger();

           
            $sendData = array(
                'method' => 'GetTemplates',
                'profileId' => $textProfileId,
            );

            $handle = curl_init();

            curl_setopt($handle, CURLOPT_URL,  $this->apiUrl);
            curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($handle, CURLOPT_POST, true);
            curl_setopt($handle, CURLOPT_POSTFIELDS, http_build_query($sendData));

            $result = curl_exec($handle);

            $resultCode = curl_getinfo($handle, CURLINFO_HTTP_CODE);
            $errorMessage = curl_error($handle);

            $data = $result ? json_decode($result, true) : null;

            $logger->debug('Curl result code: ' . $resultCode . ($errorMessage ? ', error message: "' . $errorMessage . '"' : ''), $data);

            curl_close($handle);

            if (!$data || !$data['IsSuccess'])
            {
                $logger->info('TEXT TEMPLATE EMPTY WITH MESSAGE', $data['ErrorMessage']);
                return false;
            }

            return $data['Templates'];
        }
    }

   
}
