<?php

require_once 'pbr-lib-common/src/Entity/abstract.Entity.php';

/**
 * Класс Immo_MobileCommerce_Partner
 *
 * @copyright Inform-Mobil
 * @author Vadim Kurochkin <kurochkin@immo.ru>
 */
class Immo_MobileCommerce_User extends Immo_MobileCommerce_Entity
{
    /**
     * Возвращает password
     *
     * @return string
     */
    public function getId()
    {
        if (!isset($this->_data['user_id'])) { return null; }
        return $this->_data['user_id'];
    }
    
    /**
     * Устанавливает partnerId
     *
     * @param integer $partnerId
     * @return Immo_MobileCommerce_Partner
     */
    public function setId($userId)
    {
        $this->_data['user_id'] = $userId;
        return $this;
    }
    
    /**
     * Возвращает username
     *
     * @return string
     */
    public function getUsername()
    {
        if (!isset($this->_data['username'])) { return null; }
        return $this->_data['username'];
    }

    /**
     * Устанавливает username
     *
     * @param string $username
     * @return Immo_MobileCommerce_Partner
     */
    public function setUsername($username)
    {
        $this->_data['username'] = $username;
        return $this;
    }
    
    /**
     * Возвращает password
     *
     * @return string
     */
    public function getPassword()
    {
        if (!isset($this->_data['password'])) { return null; }
        return $this->_data['password'];
    }
        
    /**
     * Устанавливает password
     *
     * @param string $password
     * @return Immo_MobileCommerce_Partner
     */
    public function setPassword($password)
    {
        $this->_data['password'] = $password;
        return $this;
    }
    
    /**
     * Возвращает email
     *
     * @return string
     */
    public function getEmail()
    {
        if (!isset($this->_data['email'])) { return null; }
        return $this->_data['email'];
    }
    
    /**
     * Устанавливает email
     *
     * @param string $email
     * @return Immo_MobileCommerce_Partner
     */
    public function setEmail($email)
    {
        $this->_data['email'] = $email;
        return $this;
    }
    
    /**
     * Возвращает isActive
     *
     * @return string
     */
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
    
    /**
     * Возвращает isDeleted
     *
     * @return string
     */
    public function getIsDeleted()
    {
        if (!isset($this->_data['is_deleted'])) { return null; }
        return $this->_data['is_deleted'];
    }
    
    /**
     * Устанавливает isDeleted
     *
     * @param string $isDeleted
     * @return Immo_MobileCommerce_Partner
     */
    public function setIsDeleted($isDeleted)
    {
        $this->_data['is_deleted'] = $isDeleted;
        return $this;
    }
    
    /**
     * Возвращает partnerId
     *
     * @return integer
     */
    public function getPartnerId()
    {
        if (!isset($this->_data['partner_id'])) { return null; }
        return $this->_data['partner_id'];
    }
    
    /**
     * Устанавливает partnerId
     *
     * @param string $partnerId
     * @return Immo_MobileCommerce_Partner
     */
    public function setPartnerId($partnerId)
    {
        $this->_data['partner_id'] = $partnerId;
        return $this;
    }
    
    /**
     * Возвращает type
     *
     * @return string
     */
    public function getType()
    {
        if (!isset($this->_data['type'])) { return null; }
        return $this->_data['type'];
    }
    
    /**
     * Устанавливает type
     *
     * @param string $type
     * @return Immo_MobileCommerce_Partner
     */
    public function setType($type)
    {
        $this->_data['type'] = $type;
        return $this;
    }

    
    /**
     * Return PaymentExcelRelation
     *
     * @return string
     */
    public function getPaymentExcelRelation()
    {
        if (!isset($this->_data['payment_excel_relation'])) { return null; }
        return $this->_data['payment_excel_relation'];
    }
        
    /**
     * Setup PaymentExcelRelation
     *
     * @param string $paymentExcelRelation
     * @return Immo_MobileCommerce_User
     */
    public function setPaymentExcelRelation($paymentExcelRelation)
    {
        $this->_data['payment_excel_relation'] = $paymentExcelRelation;
        return $this;
    }    
}
