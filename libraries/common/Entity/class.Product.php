<?php

require_once 'pbr-lib-common/src/Entity/abstract.Entity.php';


class Immo_MobileCommerce_Product extends Immo_MobileCommerce_Entity
{
    /*
     * Список параметров из базы, для которых еще не созданы константы
"ProductStatSaver";"В статистику";"Сохранять ли данные по продукту в статистике?";"Checkbox";"product"
"IPAccessList";"В списке ip";"Список разрешенных ip-адресов";"Array";"product"
"CallbackUrls";"Колбекурлы";"Url-адреса для отправки колбека";"AssocArray";"product"
"ProductMonitoring";"Мониторинг";"Список мониторинга для продукта";"AssocArray";"product"
"ServiceMonitoring";"Мониторинг";"Список мониторинга для сервиса";"AssocArray";"service"
"BillingPrefix";"Префиксы опов";"Префиксы биллинга для опов/цен (мультилайн)";"AssocArray";"service"
"BillingPrefixDefault";"Префикс";"Префикс биллинга по умолчанию";"String";"service"
    */

    const PARAM_SMS_PREFIX_FOR_INIT = 'SmsPrefixForInit'; //"Префикс смс";"Префикс для смс-инициации";"String"
    const PARAM_INIT_PAYMENT_PASS = 'InitPaymentPass'; //"Инит-пароль";"Пароль для InitPayment";"String"
    const PARAM_SMS_NOTIFICATION_PLUG_NAME = 'SmsNotificationPlugName'; //"Имя плага";"Имя плага для смс-нотификации [Цифры, лат.буквы, минусы, подчеркивания]";"String";"product"

    const PARAM_WEB_INIT_PAYMENT_TYPE = 'WebInitPaymentType'; //"Тип формы для оплаты";"Тип формы для оплаты с сайта партнера"

    /**
     * Возвращает password
     *
     * @return string
     */
    public function getId()
    {
        if (!isset($this->_data['product_id'])) { return null; }
        return $this->_data['product_id'];
    }
    
    /**
     * Устанавливает partnerId
     *
     * @param integer $partnerId
     * @return Immo_MobileCommerce_Partner
     */
    public function setId($productId)
    {
        $this->_data['product_id'] = $productId;
        return $this;
    }
    
    /**
     * Возвращает username
     *
     * @return string
     */
    public function getName()
    {
        if (!isset($this->_data['product_name'])) { return null; }
        return $this->_data['product_name'];
    }

    /**
     * Устанавливает username
     *
     * @param string $username
     * @return Immo_MobileCommerce_Partner
     */
    public function setName($username)
    {
        $this->_data['product_name'] = $username;
        return $this;
    }
    
    public function getIsActive()
    {
        if (!isset($this->_data['is_active'])) { return null; }
        return $this->_data['is_active'];
    }
    
    /**
     * Устанавливает isActive
     *
     * @param string $isActive
     * @return Immo_MobileCommerce_Partner
     */
    public function setIsActive($isActive)
    {
        $this->_data['is_active'] = $isActive;
        return $this;
    }


    public function getTextProfileId()
    {
        return (isset($this->_data['text_profile_id']) ? $this->_data['text_profile_id'] : null);
    }

    public function setTextProfileId($value)
    {
        $this->_data['text_profile_id'] = $value;
        return $this;
    }


    public function getIsAccept()
    {
        return (isset($this->_data['is_accept']) ? $this->_data['is_accept'] : null);
    }

    public function setIsAccept($value)
    {
        $this->_data['is_accept'] = $value;
        return $this;
    }


    public function getTitle()
    {
        return (isset($this->_data['title']) ? $this->_data['title'] : null);
    }

    public function setTitle($value)
    {
        $this->_data['title'] = $value;
        return $this;
    }
}
