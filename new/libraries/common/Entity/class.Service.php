<?php

require_once 'pbr-lib-common/src/Entity/abstract.Entity.php';

/**
 * class Immo_MobileCommerce_Service
 *
 * @copyright Inform-Mobil
 * @author Vadim Kurochkin <kurochkin@immo.ru>
 */
class Immo_MobileCommerce_Service extends Immo_MobileCommerce_Entity
{
	const TYPE_INTERNET_SHOP                = 1;
	const TYPE_BILLING			= 2;
        const TYPE_INTERNET_SHOP_WITH_SMS_INIT	= 3;
	const TYPE_BILLING_WITH_SMS_INIT	= 4;
	
    /*
     * set serviceId
     *
     * @param integer $serviceId
     * @return Immo_MobileCommerce_Service
     */
    public function setId($serviceId)
    {
        $this->_data['service_id'] = $serviceId;
        return $this;
    }

    /**
     * set partnerId
     *
     * @param integer $partnerId
     * @return Immo_MobileCommerce_Service
     */
    public function setPartnerId($partnerId)
    {
        $this->_data['partner_id'] = $partnerId;
        return $this;
    }

    /**
     * set smsPrefix
     *
     * @param string $smsPrefix
     * @return Immo_MobileCommerce_Service
     */
    public function setSmsPrefix($smsPrefix)
    {
        $this->_data['sms_prefix'] = $smsPrefix;
        return $this;
    }

    /**
     * set order
     *
     * @param integer $order
     * @return Immo_MobileCommerce_Service
     */
    public function setOrder($order)
    {
        $this->_data['order'] = $order;
        return $this;
    }

    /**
     * set defaultSum
     *
     * @param integer $defaultSum
     * @return Immo_MobileCommerce_Service
     */
    public function setDefaultSum($defaultSum)
    {
        $this->_data['default_sum'] = $defaultSum;
        return $this;
    }

    /**
     * set description
     *
     * @param string $description
     * @return Immo_MobileCommerce_Service
     */
    public function setDescription($description)
    {
        $this->_data['description'] = $description;
        return $this;
    }

    /**
     * set paymentLifetime
     *
     * @param integer $paymentLifetime
     * @return Immo_MobileCommerce_Service
     */
    public function setPaymentLifetime($paymentLifetime)
    {
        $this->_data['payment_lifetime'] = $paymentLifetime;
        return $this;
    }
	
	/**
     * set smsTemplate
     *
     * @param text $smsTemplate
     * @return Immo_MobileCommerce_Service
     */
    public function setSmsTemplate($template)
    {
        $this->_data['sms_template'] = $template;
        return $this;
    }
    
    public function getServiceType()
    {
       if (!isset($this->_data['type'])) { return null; }
        return $this->_data['type'];
    }

	/**
     * set defaultComment
     *
     * @param text $defaultComment
     * @return Immo_MobileCommerce_Service
     */
    public function setDefaultComment($comment)
    {
        $this->_data['default_comment'] = $defaultComment;
        return $this;
    }
	
	/**
     * set params
     *
     * @param text $params
     * @return Immo_MobileCommerce_Service
     */
    public function setParams($params)
    {
        $this->_data['params'] = $params;
        return $this;
    }
	
	/**
     * set minSum
     *
     * @param text $sum
     * @return Immo_MobileCommerce_Service
     */
    public function setMinSum($sum)
    {
        $this->_data['min_sum'] = $sum;
        return $this;
    }
	
	/**
     * set maxSum
     *
     * @param text $sum
     * @return Immo_MobileCommerce_Service
     */
    public function setMaxSum($sum)
    {
        $this->_data['max_sum'] = $sum;
        return $this;
    }
	
	/**
     * set fee
     *
     * @param text $fee
     * @return Immo_MobileCommerce_Service
     */
    public function setFee($fee)
    {
        $this->_data['fee'] = $fee;
        return $this;
    }
	
	/**
     * set operator_groups
     *
     * @param text $fee
     * @return Immo_MobileCommerce_Service
     */
    public function setOperatorGroups($operatorGroups)
    {
		if (!is_array($operatorGroups)) $operatorGroups = array($operatorGroups);

        $this->_data['operator_groups'] = $operatorGroups;
        return $this;
    }
	
    /**
     * get serviceId
     *
     * @return integer
     */
    public function getId()
    {
        if (!isset($this->_data['service_id'])) { return null; }
        return $this->_data['service_id'];
    }

    /**
     * get partnerId
     *
     * @return integer
     */
    public function getPartnerId()
    {
        if (!isset($this->_data['partner_id'])) { return null; }
        return $this->_data['partner_id'];
    }

    /**
     * get smsPrefix
     *
     * @return string
     */
    public function getSmsPrefix()
    {
        if (!isset($this->_data['sms_prefix'])) { return null; }
        return $this->_data['sms_prefix'];
    }

    /**
     * get order
     *
     * @return integer
     */
    public function getOrder()
    {
        if (!isset($this->_data['order'])) { return null; }
        return $this->_data['order'];
    }

    /**
     * get defaultSum
     *
     * @return integer
     */
    public function getDefaultSum()
    {
        if (!isset($this->_data['default_sum'])) { return null; }
        return $this->_data['default_sum'];
    }

    /**
     * get description
     *
     * @return string
     */
    public function getDescription()
    {
        if (!isset($this->_data['description'])) { return null; }
        return $this->_data['description'];
    }

    /**
     * get paymentLifetime
     *
     * @return integer
     */
    public function getPaymentLifetime()
    {
        if (!isset($this->_data['payment_lifetime'])) { return null; }
        return $this->_data['payment_lifetime'];
    }
	
    /**
     * get smsTemplate
     *
     * @return text
     */
    public function getSmsTemplate()
    {
        if (!isset($this->_data['sms_template'])) { return null; }
        return $this->_data['sms_template'];
    }
	
    /**
     * get defaultComment
     *
     * @return text
     */
    public function getDefaultComment()
    {
        if (!isset($this->_data['default_comment'])) { return null; }
        return $this->_data['default_comment'];
    }
	
    /**
     * get params
     *
     * @return text
     */
    public function getParams()
    {
        if (!isset($this->_data['params'])) { return null; }
        return $this->_data['params'];
    }
	
    /**
     * get minSum
     *
     * @return text
     */
    public function getMinSum()
    {
        if (!isset($this->_data['min_sum'])) { return null; }
        return $this->_data['min_sum'];
    }
	
	/**
     * get maxSum
     *
     * @return text
     */
    public function getMaxSum()
    {
        if (!isset($this->_data['max_sum'])) { return null; }
        return $this->_data['max_sum'];
    }
	
    /**
     * get fee
     *
     * @return text
     */
    public function getFee()
    {
        if (!isset($this->_data['fee'])) { return null; }
        return $this->_data['fee'];
    }
	
	/**
     * get operator_groups
     *
     * @return text
     */
    public function getOperatorGroups()
    {
        if (!isset($this->_data['operator_groups'])) { return null; }
        return $this->_data['operator_groups'];
    }

    public function getServiceName()
    {
        if (!isset($this->_data['service_name'])) { return null; }
        return $this->_data['service_name'];
    }

    public function getProcessingId()
    {
        if (!isset($this->_data['processing_id'])) { return null; }
        return $this->_data['processing_id'];
    }

    public function setProcessingId($val)
    {
        $this->_data['processing_id'] = $val;
        return $this;
    }

    public function setServiceName($val)
    {
        $this->_data['service_name'] = $val;
        return $this;
    }
	
		
	/**
     * get is_accept 
     *
     * @return string
     */
    public function getIsAccept()
    {
        if (!isset($this->_data['is_accept'])) { return null; }
        return $this->_data['is_accept'];
    }
    
    /**
     * set is_accept
     *
     * @param string $isAccept
     * @return Immo_MobileCommerce_ApplicationKey
     */
    public function setIsAccept($isAccept)
    {
        $this->_data['is_accept'] = $isAccept;
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
}
