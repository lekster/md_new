<?php

require_once 'pbr-lib-common/src/Entity/abstract.Entity.php';

/**
 * ����� Immo_MobileCommerce_Partner
 *
 * @copyright Inform-Mobil
 * @author Vadim Kurochkin <kurochkin@immo.ru>
 */
class Immo_MobileCommerce_Partner extends Immo_MobileCommerce_Entity
{
    /**
     * ������������� partnerId
     *
     * @param integer $partnerId
     * @return Immo_MobileCommerce_Partner
     */
    public function setId($partnerId)
    {
        $this->_data['partner_id'] = $partnerId;
        return $this;
    }

    /**
     * ������������� name
     *
     * @param string $name
     * @return Immo_MobileCommerce_Partner
     */
    public function setName($name)
    {
        $this->_data['name'] = $name;
        return $this;
    }

    /**
     * ������������� paymentAcceptingPartnerId
     *
     * @param integer $paymentAcceptingPartnerId
     * @return Immo_MobileCommerce_Partner
     */
    public function setPaymentAcceptingPartnerId($paymentAcceptingPartnerId)
    {
        $this->_data['payment_accepting_partner_id'] = $paymentAcceptingPartnerId;
        return $this;
    }

    /**
     * ������������� configDir
     *
     * @param string $configDir
     * @return Immo_MobileCommerce_Partner
     */
    public function setConfigDir($configDir)
    {
        $this->_data['config_dir'] = $configDir;
        return $this;
    }

    /**
     * ������������� description
     *
     * @param string $description
     * @return Immo_MobileCommerce_Partner
     */
    public function setDescription($description)
    {
        $this->_data['description'] = $description;
        return $this;
    }
	
    /**
     * ������������� sslClientCert
     *
     * @param string $cert
     * @return Immo_MobileCommerce_Partner
     */
    public function setSslClientCert($cert)
    {
        $this->_data['ssl_client_cert'] = $cert;
        return $this;
    }
	
    /**
     * ������������� username
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
     * ������������� password
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
     * ������������� parentId
     *
     * @param string $parentId
     * @return Immo_MobileCommerce_Partner
     */
    public function setParentId($parentId)
    {
        $this->_data['parent_id'] = $parentId;
        return $this;
    }
    
    /**
     * ���������� parentId
     *
     * @return integer
     */
    public function getParentId()
    {
        if (!isset($this->_data['parent_id'])) { return null; }
        return $this->_data['parent_id'];
    }

    /**
     * ���������� partnerId
     *
     * @return integer
     */
    public function getId()
    {
        if (!isset($this->_data['partner_id'])) { return null; }
        return $this->_data['partner_id'];
    }

    /**
     * ���������� name
     *
     * @return string
     */
    public function getName()
    {
        if (!isset($this->_data['name'])) { return null; }
        return $this->_data['name'];
    }

    /**
     * ���������� paymentAcceptingPartnerId
     *
     * @return integer
     */
    public function getPaymentAcceptingPartnerId()
    {
        if (!isset($this->_data['payment_accepting_partner_id'])) { return null; }
        return $this->_data['payment_accepting_partner_id'];
    }

    /**
     * ���������� configDir
     *
     * @return string
     */
    public function getConfigDir()
    {
        if (!isset($this->_data['config_dir'])) { return null; }
        return $this->_data['config_dir'];
    }

    /**
     * ���������� description
     *
     * @return string
     */
    public function getDescription()
    {
        if (!isset($this->_data['description'])) { return null; }
        return $this->_data['description'];
    }
	
	/**
     * ���������� sslClientCert
     *
     * @return string
     */
    public function getSslClientCert()
    {
        if (!isset($this->_data['ssl_client_cert'])) { return null; }
        return $this->_data['ssl_client_cert'];
    }
	
	/**
     * ���������� username
     *
     * @return string
     */
    public function getUsername()
    {
        if (!isset($this->_data['username'])) { return null; }
        return $this->_data['username'];
    }
	
	/**
     * ���������� password
     *
     * @return string
     */
    public function getPassword()
    {
        if (!isset($this->_data['password'])) { return null; }
        return $this->_data['password'];
    }
}
