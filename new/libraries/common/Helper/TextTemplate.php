<?php

class Pbr_Helper_TextTemplate
{
	static protected $templateTokens = array();
	//http://asmirnov.testm40.web.immo/mobile-commerce-rpc/htdocs/webservices/textTemplate.php?method=GetTemplates&profileId=24

	static public function buildTextByTemplate($template, $values = null)
	{
		if (!$template) return '';

		return self::buildText(self::parseTemplate($template), $values);
	}

	static public function buildTextByProfile($textProfileId, $type, $values = null)
	{
		return self::buildText(self::getTemplateByTextProfileIdAndType($textProfileId, $type), $values);
	}

    static public function getTemplateByTextProfileIdAndType($textProfileId, $type)
    {
        if (!$textProfileId || !$type) throw new Exception('TextProfileId or type empty');

        if (!isset(self::$templateTokens[$textProfileId][$type]))
        {
            $serviceLocator = Immo_MobileCommerce_ServiceLocator::getInstance();

            $logger = $serviceLocator->getLogger();

            $url = $serviceLocator->getConfig()->get('TextTemplateApiUrl', 'Global');

            if (!$url) throw new Exception('Not set Global.TextTemplateApiUrl');

            $sendData = array(
                'method' => 'GetTemplate',
                'profileId' => $textProfileId,
                'type' => $type,
            );

            $handle = curl_init();

            curl_setopt($handle, CURLOPT_URL, $url);
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

            return $data['Text'];
        }
    }

	static public function buildTextByTransaction(Pbr_Entity_Transaction $transaction, $type, $template = null)
	{
		$textProfileId = $transaction->getTextProfileId();

		if (!$textProfileId) return '';

		$tokens = $template ?
			self::parseTemplate($template) :
			self::getTemplateTokensByTextProfileIdAndType($textProfileId, $type);

		if (!$tokens) return '';

		$values = array();

		if ($tokens['params'])
		{
			$values['sum'] = $transaction->getSumProcessing();
			$values['msisdn'] = $transaction->getMsisdn();
			$values['transactionGuid'] = $transaction->getUuid();
		}

		return self::buildText($tokens, $values);
	}


	static protected function getTemplateTokensByTextProfileIdAndType($textProfileId, $type)
	{
		if (!$textProfileId || !$type) throw new Exception('TextProfileId or type empty');

		if (!isset(self::$templateTokens[$textProfileId][$type]))
		{
			$serviceLocator = Immo_MobileCommerce_ServiceLocator::getInstance();

			$logger = $serviceLocator->getLogger();

			$url = $serviceLocator->getConfig()->get('TextTemplateApiUrl', 'Global');

			if (!$url) throw new Exception('Not set Global.TextTemplateApiUrl');

			$sendData = array(
				'method' => 'GetTemplate',
				'profileId' => $textProfileId,
				'type' => $type,
			);

			// $logger->debug('getTemplateTokensByTextProfileIdAndType sendData', $sendData);

			$handle = curl_init();

			curl_setopt($handle, CURLOPT_URL, $url);
			curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($handle, CURLOPT_POST, true);
			curl_setopt($handle, CURLOPT_POSTFIELDS, http_build_query($sendData));

			$result = curl_exec($handle);

			$resultCode = curl_getinfo($handle, CURLINFO_HTTP_CODE);
			$errorMessage = curl_error($handle);

			$data = $result ? json_decode($result, true) : null;

			$logger->debug('Curl result code: ' . $resultCode . ($errorMessage ? ', error message: "' . $errorMessage . '"' : ''), $data);

			curl_close($handle);

			if (!$data || !$data['IsSuccess']) throw new Exception('Get text template FAIL');

			self::$templateTokens[$textProfileId][$type] = self::parseTemplate($data['Template']);
		}

		return self::$templateTokens[$textProfileId][$type];
	}


	static protected function buildText($templateTokens, $values = null)
	{
		if (!$templateTokens) return '';

		$tokens = $templateTokens['tokens'];

		if (is_array($values))
		foreach ($templateTokens['params'] as $k => $p)
			if (isset($values[$p])) $tokens[$k] = $values[$p];

		return implode($tokens);
	}


	static protected function parseTemplate($template)
	{
		$words = explode('%', $template);

		$tokens = array();
		$params = array();

		$isParam = false;

		foreach ($words as $n => $word)
		{
			if ($isParam)
			{
				$tokens[$n] = '';
				$params[$n] = $word;
				$isParam = false;
			}
			else
			{
				$tokens[$n] = $word;
				$isParam = true;
			}
		}

		return array(
			'template' => $template,
			'tokens' => $tokens,
			'params' => $params,
		);
	}
}
