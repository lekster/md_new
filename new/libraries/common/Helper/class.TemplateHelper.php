<?php
/**
 * ����� Immo_MobileCommerce_Helper_TemplateHelper
 * 
 * @copyright Inform-Mobil
 * @author Vadim Kurochkin <kurochkin@immo.ru>
 */
class Immo_MobileCommerce_Helper_TemplateHelper
{
	public static function processTemplate($text, $params)
	{
		foreach($params as $key => $value)
		{
			$text = preg_replace('/%'.$key.'%/u', $value, $text);
		}
                if (isset($params['product_id']))
                {
                    $text = str_ireplace('%account%', $params['product_id'], $text);
                }
		return $text;
	}
}