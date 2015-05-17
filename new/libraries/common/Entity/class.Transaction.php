<?php

require_once 'pbr-lib-common/src/Entity/abstract.Entity.php';

/**
 * Класс Immo_MobileCommerce_Transaction
 *
 * @copyright Inform-Mobil
 * @author Vadim Kurochkin <kurochkin@immo.ru>
 */
class Immo_MobileCommerce_Transaction extends Immo_MobileCommerce_Entity
{
	// `status`
	const STATUS_WAIT               = 0;	// Состояние ожидания (замороженная транзакция)
	const STATUS_READY_TO_INIT		= 1;	// Готов к инициализации платежа
	const STATUS_INITING			= 2;	// Инициализация платежа
    const STATUS_READY_TO_ACCEPT    = 5;    // Ожидание акцепта
	const STATUS_INIT_FAILED		= 10;	// Ошибка инициализации платежа
	const STATUS_INIT_SUCCESS		= 11;	// Платеж успешно инициализирован
	
	const STATUS_CHECK_FAILED		= 20;	// Ошибка принятия запроса оферты
	const STATUS_CHECK_SUCCESS		= 21;	// Запрос оферты принят успешно
	
	const STATUS_CONFIRM_FAILED		= 30;	// Ошибка принятия запроса на предоставление услуги
	const STATUS_CONFIRM_SUCCESS	= 31;	// Запрос на предоставление услуги принят успешно
	const STATUS_CANCEL_FAILED		= 40;	// Ошибка принятия запроса на отмену предоставления услуги
	const STATUS_CANCEL_SUCCESS		= 41;	// Запроса на отмену предоставления услуги принят успешно
	
	const PARTNER_STATE_TARRIFICATION_SUCCESS = 'TARIFFED';
	const PARTNER_STATE_TARRIFICATION_FAIL    = 'FAILED';

    const STATUS_CONFIRM_SUCCESS_CUSTOM             = 131;	// Запрос на предоставление услуги принят успешно
	const STATUS_CANCEL_SUCCESS_CUSTOM		= 141;	// Запроса на отмену предоставления услуги принят успешно

    const STATUS_VALIDATE_FAIL      = 50;	// Ошибка валидации на стороне партнера
    const STATUS_NEED_TO_SEND_TO_NEXT_ROUTE_POINT      = 60;	// Необходимо отправить на следующий маршрутный пункт


	// Статусы МобиДенег PAYMENT_*
	
	const PAYMENT_INIT_RESULT_CODE_SUCCESS	= 1;	// Успех
	
	// `result_code`
	
	const PAYMENT_CANCELLATION_RESULT_CODE_SYSTEM_ERROR						= 2;	// Техническая ошибка
	const PAYMENT_CANCELLATION_RESULT_CODE_SERVICE_UNAVAILABLE				= 10;	// Услуга недоступна Клиенту
	const PAYMENT_CANCELLATION_RESULT_CODE_NO_MONEY							= 12;	// Недостаточно средств на абонентском счёте Клиента
	const PAYMENT_CANCELLATION_RESULT_CODE_LIMIT_EXCEED						= 13;	// Превышены лимиты
	const PAYMENT_CANCELLATION_RESULT_CODE_NEW_TRANSACTION					= 14;	// Транзакция отменена по причине начала новой транзакции
	const PAYMENT_CANCELLATION_RESULT_CODE_SERVICE_TEMPORARY_UNAVAILABLE	= 20;	// Сервис временно недоступен
	const PAYMENT_CANCELLATION_RESULT_CODE_LOW_BALANCE						= 105;	// В результате платежа остаток на счёте станет меньше минимального
	const PAYMENT_CANCELLATION_RESULT_CODE_EMPTY_RESOURCE					= 115;	// Магазин вернул пустой ресурс
	const PAYMENT_CANCELLATION_RESULT_CODE_TIMEOUT							= 116;	// Истек таймаут сетевого ожидания
	const PAYMENT_CANCELLATION_RESULT_CODE_USER_ABORT_TRANSACTION			= 16;	// Абонент не подтвердил транзакцию

	// `callback_status`
	
	const CALLBACK_STATUS_READY_TO_CALL	= 0;	// Транзакция готова к вызову коллбека
	const CALLBACK_STATUS_CALLING		= 1;	// Вызов SOAP-сервиса партнера для оповещения о статусе платежа, если задан confirm_payment_callback_url
	const CALLBACK_STATUS_FAILED		= 10;	// Ошибка оповещения партнера о платеже
	const CALLBACK_STATUS_SUCCESS		= 11;	// Партнер успешно оповещен о платеже
	
	// Метод инициализации платежа
	
	const TARGET_PBSOL_SITE_WEBFORM		= 1;	// С формы пополнения счета на сайте pbsol.ru
	const TARGET_PBSOL_PARTNER_WIFC		= 2;	// С партнерского WEB-интерфейса
	const TARGET_PBSOL_PARTNER_RPC		= 4;	// Посредством вызова RPC
	const TARGET_PBSOL_SMS				= 8;	// Отправкой SMS
	const TARGET_PARTNER_SITE_WEBFORM	= 16;	// С формы пополнения счета на сайте партнера
	
	// Статусы сверки транзакций с банковскими данными (report_status)
	
	const REPORT_STATUS_WAITING			= 0;	// Ожидает подтверждения
	const REPORT_STATUS_CONFIRMING		= 1;	// Ожидает подтверждения
	const REPORT_STATUS_CONFIRM_FAIL	= 10;	// Ошибка в процессе сверки (данные расходятся)
	const REPORT_STATUS_CONFIRM_SUCCESS	= 11;	// Платеж успешно подтвержден
	
	// Статусы отправки транзакций в биллинг
	
	const BILLING_STATUS_WAITING		= 0;
	const BILLING_STATUS_SENDED_FAIL	= 10;
	const BILLING_STATUS_SENDED_SUCCESS	= 11;
    
	/*
    public static $transactionStatusesTranscript = array (
        '0' => array (
            'name' => '',
            'statuses' => null
            ),

        '1' => array (
            'name' => 'Проведение платежа',
            'statuses' => array (
							Immo_MobileCommerce_Transaction::STATUS_WAIT,
                            Immo_MobileCommerce_Transaction::STATUS_READY_TO_INIT, 
                            Immo_MobileCommerce_Transaction::STATUS_INITING, 
                            Immo_MobileCommerce_Transaction::STATUS_INIT_SUCCESS, 
                            Immo_MobileCommerce_Transaction::STATUS_CHECK_SUCCESS,
                            Immo_MobileCommerce_Transaction::STATUS_CANCEL_FAILED
                          )
            ),

        '2' => array (
            'name' => 'Платеж проведен',
            'statuses' => array(Immo_MobileCommerce_Transaction::STATUS_CONFIRM_SUCCESS)
            ),

        '3' => array (
            'name' => 'Платеж отменен',
            'statuses' => array(
                            Immo_MobileCommerce_Transaction::STATUS_INIT_FAILED, 
                            Immo_MobileCommerce_Transaction::STATUS_CHECK_FAILED, 
                            Immo_MobileCommerce_Transaction::STATUS_CONFIRM_FAILED, 
                            Immo_MobileCommerce_Transaction::STATUS_CANCEL_SUCCESS
                          )
        ),
    );
	*/
    
	public function calculateSum(Immo_MobileCommerce_Strategy_CalculatePaymentSum $strategy)
	{
		$this->setSumService($strategy->getServiceSum());
		$this->_logger->debug('SERVICE SUM', $strategy->getServiceSum());
		
		$this->setSumUser($strategy->getUserSum());
		$this->_logger->debug('USER SUM', $strategy->getUserSum());
		
		$this->setSum($strategy->getAcceptingPaymentPartnerSum());
		$this->_logger->debug('ACCEPTING PAYMENT PARTNER SUM', $strategy->getAcceptingPaymentPartnerSum());

		$this->setSumPbsol($strategy->getPbsolSum());
		$this->_logger->debug('PBSOL SUM', $strategy->getPbsolSum());
		
		$this->setSumPartner($strategy->getPartnerSum());
		$this->_logger->debug('PARTNER SUM', $strategy->getPartnerSum());
		
		$this->setSumServicePrecise($strategy->getServiceSumPrecise());
		$this->_logger->debug('SERVICE SUM PRECISE', $strategy->getServiceSumPrecise());
	}
	
	public function confirm(Immo_MobileCommerce_Strategy_ConfirmPayment $strategy)
	{
		$strategy->confirm($this);
		
		$this->setReportStatus($strategy->getReportStatus());
		$this->_logger->debug('REPORT STATUS', $strategy->getReportStatus());
		
		$this->setReportComment($strategy->getReportComment());
		$this->_logger->debug('REPORT COMMENT', $strategy->getReportComment());
	}
	
	public function convert(Immo_MobileCommerce_Strategy_ConvertTransaction $strategy)
	{
		return $strategy->convert($this);
	}
	
	public function calculateCallbackDelayedUntil(Immo_MobileCommerce_Strategy_CalculateDelayedUntilTime $strategy, $delayedUntilIntervals)
	{
		$this->setCallbackDelayedUntil($strategy->calculate($this->getCallbackAttemptCount(), $delayedUntilIntervals));
	}
	
	public function calculateBillingDelayedUntil(Immo_MobileCommerce_Strategy_CalculateDelayedUntilTime $strategy, $delayedUntilIntervals)
	{
		$this->setBillingDelayedUntil($strategy->calculate($this->getBillingAttemptCount(), $delayedUntilIntervals));
	}
	
    /**
     * Устанавливает transactionId
     *
     * @param integer $transactionId
     * @return Immo_MobileCommerce_Transaction
     */
    public function setId($transactionId)
    {
        $this->_data['transaction_id'] = $transactionId;
        return $this;
    }

    /**
     * Устанавливает msisdn
     *
     * @param string $msisdn
     * @return Immo_MobileCommerce_Transaction
     */
    public function setMsisdn($msisdn)
    {
        $this->_data['msisdn'] = $msisdn;
        return $this;
    }

    /**
     * Устанавливает status
     *
     * @param integer $status
     * @return Immo_MobileCommerce_Transaction
     */
    public function setStatus($status)
    {
        $this->_data['status'] = $status;
        return $this;
    }

    /**
     * Устанавливает dateCreate
     *
     * @param string $dateCreate
     * @return Immo_MobileCommerce_Transaction
     */
    public function setDateCreate($dateCreate)
    {
        $this->_data['date_create'] = $dateCreate;
        return $this;
    }

    /**
     * Устанавливает dateModify
     *
     * @param string $dateModify
     * @return Immo_MobileCommerce_Transaction
     */
    public function setDateModify($dateModify)
    {
        $this->_data['date_modify'] = $dateModify;
        return $this;
    }

    /**
     * Устанавливает sum
     *
     * @param integer $sum
     * @return Immo_MobileCommerce_Transaction
     */
    public function setSum($sum)
    {
        $this->_data['sum'] = $sum;
        return $this;
    }

    /**
     * Устанавливает comment
     *
     * @param string $comment
     * @return Immo_MobileCommerce_Transaction
     */
    public function setComment($comment)
    {
        $this->_data['comment'] = $comment;
        return $this;
    }
	
	/**
     * Устанавливает params
     *
     * @param string $params
     * @return Immo_MobileCommerce_Transaction
     */
    public function setParams($params)
    {
        $this->_data['params'] = $params;
        return $this;
    }

    public function setParamsArr(array $params)
    {
        $this->_data['params'] = http_build_query($params);
        return $this;
    }
	
	/**
     * Устанавливает transaction_guid
     *
     * @param string $transaction_guid
     * @return Immo_MobileCommerce_Transaction
     */
    public function setTransactionGuid($transaction_guid)
    {
        $this->_data['transaction_guid'] = $transaction_guid;
        return $this;
    }
	
	/**
     * Устанавливает route_id
     *
     * @param integer $route_id
     * @return Immo_MobileCommerce_Transaction
     */
    public function setRouteId($route_id)
    {
        $this->_data['route_id'] = $route_id;
        return $this;
    }
		
	/**
     * Устанавливает parentGuid
     *
     * @param string $parentGuid
     * @return Immo_MobileCommerce_Transaction
     */
    public function setParentGuid($parentGuid)
    {
        $this->_data['parent_guid'] = $parentGuid;
        return $this;
    }
	
	/**
     * Устанавливает virginPrice
     *
     * @param integer $virginPrice
     * @return Immo_MobileCommerce_Transaction
     */
    public function setVirginPrice($virginPrice)
    {
        $this->_data['virgin_price'] = $virginPrice;
        return $this;
    }
	
	/**
     * Устанавливает serviceId
     *
     * @param string $serviceId
     * @return Immo_MobileCommerce_Transaction
     */
    public function setServiceId($serviceId)
    {
        $this->_data['service_id'] = $serviceId;
        return $this;
    }
	
	/**
     * Устанавливает callbackStatus
     *
     * @param string $status
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCallbackStatus($status)
    {
        $this->_data['callback_status'] = $status;
        return $this;
    }
	
	/**
     * Устанавливает callbackAttemptCount
     *
     * @param string $count
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCallbackAttemptCount($count)
    {
        $this->_data['callback_attempt_count'] = $count;
        return $this;
    }
	
	/**
     * Устанавливает resultCode
     *
     * @param string $code
     * @return Immo_MobileCommerce_Transaction
     */
    public function setResultCode($code)
    {
        $this->_data['result_code'] = $code;
        return $this;
    }
	
	/**
     * Устанавливает resultDescription
     *
     * @param string $desc
     * @return Immo_MobileCommerce_Transaction
     */
    public function setResultDescription($desc)
    {
        $this->_data['result_description'] = $desc;
        return $this;
    }
	
	/**
     * Устанавливает target
     *
     * @param string $target
     * @return Immo_MobileCommerce_Transaction
     */
    public function setTarget($target)
    {
        $this->_data['target'] = $target;
        return $this;
    }
	
    /**
     * Устанавливает acceptingPaymentPartnerId
     *
     * @param integer $acceptingPaymentPartnerId
     * @return Immo_MobileCommerce_Transaction
     */
    public function setAcceptingPaymentPartnerId($acceptingPaymentPartnerId)
    {
        $this->_data['accepting_payment_partner_id'] = $acceptingPaymentPartnerId;
        return $this;
    }
	
	/**
     * Устанавливает sumUser
     *
     * @param string $sum
     * @return Immo_MobileCommerce_Transaction
     */
    public function setSumUser($sum)
    {
        $this->_data['sum_user'] = $sum;
        return $this;
    }
	
	/**
     * Устанавливает sumPbsol
     *
     * @param string $sum
     * @return Immo_MobileCommerce_Transaction
     */
    public function setSumPbsol($sum)
    {
        $this->_data['sum_pbsol'] = $sum;
        return $this;
    }
	
	/**
     * Устанавливает sumPartner
     *
     * @param string $sum
     * @return Immo_MobileCommerce_Transaction
     */
    public function setSumPartner($sum)
    {
        $this->_data['sum_partner'] = $sum;
        return $this;
    }
	
	/**
     * Устанавливает sumService
     *
     * @param string $sum
     * @return Immo_MobileCommerce_Transaction
     */
    public function setSumService($sum)
    {
        $this->_data['sum_service'] = $sum;
        return $this;
    }
	
	/**
     * Устанавливает sumServicePrecise
     *
     * @param integer $sumServicePrecise
     * @return Immo_MobileCommerce_Transaction
     */
    public function setSumServicePrecise($sumServicePrecise)
    {
        $this->_data['sum_service_precise'] = $sumServicePrecise;
        return $this;
    }
	
	/**
     * Устанавливает reportStatus
     *
     * @param string $status
     * @return Immo_MobileCommerce_Transaction
     */
    public function setReportStatus($status)
    {
        $this->_data['report_status'] = $status;
        return $this;
    }
	
	/**
     * Устанавливает reportComment
     *
     * @param string $comment
     * @return Immo_MobileCommerce_Transaction
     */
    public function setReportComment($comment)
    {
        $this->_data['report_comment'] = $comment;
        return $this;
    }
	
	/**
     * Устанавливает callbackDelayedUntil
     *
     * @param string $callbackDelayedUntil
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCallbackDelayedUntil($callbackDelayedUntil)
    {
        $this->_data['callback_delayed_until'] = $callbackDelayedUntil;
        return $this;
    }

    /**
     * Устанавливает billingStatus
     *
     * @param string $status
     * @return Immo_MobileCommerce_Transaction
     */
    public function setBillingStatus($status)
    {
        $this->_data['billing_status'] = $status;
        return $this;
    }
	
    /**
     * Устанавливает billingDelayedUntil
     *
     * @param string $billingDelayedUntil
     * @return Immo_MobileCommerce_Transaction
     */
    public function setBillingDelayedUntil($billingDelayedUntil)
    {
        $this->_data['billing_delayed_until'] = $billingDelayedUntil;
        return $this;
    }

    /**
     * Устанавливает billingAttemptCount
     *
     * @param integer $billingAttemptCount
     * @return Immo_MobileCommerce_Transaction
     */
    public function setBillingAttemptCount($billingAttemptCount)
    {
        $this->_data['billing_attempt_count'] = $billingAttemptCount;
        return $this;
    }
	
	/**
     * Устанавливает callbackDescription
     *
     * @param string $callbackDescription
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCallbackDescription($callbackDescription)
    {
        $this->_data['callback_description'] = $callbackDescription;
        return $this;
    }
	
	/**
     * Устанавливает callbackCode
     *
     * @param string $callbackCode
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCallbackCode($callbackCode)
    {
        $this->_data['callback_code'] = $callbackCode;
        return $this;
    }
	
	/**
     * Устанавливает category
     *
     * @param string $category
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCategory($category)
    {
        $this->_data['category'] = $category;
        return $this;
    }
    
    /**
     * Устанавливает partner_id
     *
     * @param string $partnerId
     * @return Immo_MobileCommerce_Transaction
     */
    public function setPartnerId($partnerId)
    {
        $this->_data['partner_id'] = $partnerId;
        return $this;
    }
    
    /**
     * Устанавливает user_id
     *
     * @param string $userId
     * @return Immo_MobileCommerce_Transaction
     */
    public function setUserId($userId)
    {
        $this->_data['user_id'] = $userId;
        return $this;
    }

    /**
     * Устанавливает payment_id
     *
     * @param string payment_id
     * @return Immo_MobileCommerce_Transaction
     */
    public function setPaymentId($paymentId)
    {
        $this->_data['payment_id'] = $paymentId;
        return $this;
    }    


    public function setProductId($val)
    {
        $this->_data['product_id'] = $val;
        return $this;
    }

    public function setRoadMap($val)
    {
        if (is_array($val))
            $this->_data['roadmap'] = $val;
        else
            $this->_data['roadmap'] = array($val);
        return $this;
    }

    public function setService($service)
    {
        if ($service instanceof Immo_MobileCommerce_Service)
        {
            $this->_data['service_type'] = $service->getServiceType();
            $this->_data['service_sms_prefix'] = $service->getSmsPrefix();
        }

        return $this;
    }

    /**
     * Устанавливает cancelCode
     *
     * @param string $code
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCancelCode($code)
    {
        $this->_data['cancel_code'] = $code;
        return $this;
    }

    /**
     * Устанавливает cancelDescription
     *
     * @param string $description
     * @return Immo_MobileCommerce_Transaction
     */
    public function setCancelDescription($description)
    {
        $this->_data['cancel_description'] = $description;
        return $this;
    }


    public function getVersion()
    {
        if (!isset($this->_data['version'])) { return null; }
        return $this->_data['version'];
    }


    public function setOperatorId($val)
    {
        $this->_data['operator_id'] = $val;
        return $this;
    }

    public function getProductId()
    {
        if (!isset($this->_data['product_id'])) { return null; }
        return $this->_data['product_id'];
    }

    public function getRoadMap()
    {
        if (!isset($this->_data['roadmap'])) { return null; }
        if (!is_array($this->_data['roadmap'])) return null;
        return "{" . implode(",", $this->_data['roadmap']) . "}";
    }

    public function getRoadMapAsArray()
    {
        if (!isset($this->_data['roadmap'])) { return null; }
        if (!is_array($this->_data['roadmap'])) return null;
        return $this->_data['roadmap'];
    }

    public function getServiceHistoryAsArray()
    {
        if (!isset($this->_data['service_history'])) { return null; }
        if (!is_array($this->_data['service_history'])) return null;
        return $this->_data['service_history'];
    }

    public function getLastStatusChanged()
    {
        if (!isset($this->_data['last_status_changed'])) { return null; }
        return $this->_data['last_status_changed'];
    }

    public function getOperatorId()
    {
        if (!isset($this->_data['operator_id'])) { return null; }
        return $this->_data['operator_id'];
    }

	
    /**
     * Возвращает transactionId
     *
     * @return integer
     */
    public function getId()
    {
        if (!isset($this->_data['transaction_id'])) { return null; }
        return $this->_data['transaction_id'];
    }

    /**
     * Возвращает msisdn
     *
     * @return string
     */
    public function getMsisdn()
    {
        if (!isset($this->_data['msisdn'])) { return null; }
        return $this->_data['msisdn'];
    }

    /**
     * Возвращает status
     *
     * @return integer
     */
    public function getStatus()
    {
        if (!isset($this->_data['status'])) { return null; }
        return $this->_data['status'];
    }


    /**
     * Возвращает status_history
     *
     * @return integer
     */
    public function getStatusHistory()
    {
        if (!isset($this->_data['status_history'])) { return null; }
        return $this->_data['status_history'];
    }

    /**
     * Возвращает dateCreate
     *
     * @return string
     */
    public function getDateCreate()
    {
        if (!isset($this->_data['date_create'])) { return null; }
        return $this->_data['date_create'];
    }
	
	/**
     * Возвращает dateCreate в формате ISO 8601
     *
     * @return string
     */
    public function getISO8601DateCreate()
    {
        if (!isset($this->_data['date_create'])) { return null; }
        return date('c', strtotime($this->_data['date_create']));
    }

    /**
     * Возвращает dateModify
     *
     * @return string
     */
    public function getDateModify()
    {
        if (!isset($this->_data['date_modify'])) { return null; }
        return $this->_data['date_modify'];
    }
	
    /**
     * Возвращает dateModify
     *
     * @return string
     */
    public function getISO8601DateModify()
    {
		if (!isset($this->_data['date_modify'])) { return null; }
        return date('c', strtotime($this->_data['date_modify']));
    }

    /**
     * Возвращает sum
     *
     * @return integer
     */
    public function getSum()
    {
        if (!isset($this->_data['sum'])) { return null; }
        return $this->_data['sum'];
    }

    /**
     * Возвращает sum
     *
     * @return integer
     */
    public function getSumUser()
    {
        if (!isset($this->_data['sum_user'])) { return null; }
        return $this->_data['sum_user'];
    }

    /**
     * Возвращает sum
     *
     * @return integer
     */
    public function getSumPbsol()
    {
        if (!isset($this->_data['sum_pbsol'])) { return null; }
        return $this->_data['sum_pbsol'];
    }

    /**
     * Возвращает sum
     *
     * @return integer
     */
    public function getSumPartner()
    {
        if (!isset($this->_data['sum_partner'])) { return null; }
        return $this->_data['sum_partner'];
    }
	
	/**
     * Возвращает sum
     *
     * @return integer
     */
    public function getSumService()
    {
        if (!isset($this->_data['sum_service'])) { return null; }
        return $this->_data['sum_service'];
    }

    /**
     * Возвращает comment
     *
     * @return string
     */
    public function getComment()
    {
        if (!isset($this->_data['comment'])) { return null; }
        return $this->_data['comment'];
    }
	
	/**
     * Возвращает params
     *
     * @return string
     */
    public function getParams()
    {
        if (!isset($this->_data['params'])) { return null; }
        return $this->_data['params'];
    }

    public function getParamsArr()
    {
        if (!isset($this->_data['params'])) { return array(); }
        parse_str($this->_data['params'], $res);
        return $res;
    }
	
	/**
     * Возвращает transaction_guid
     *
     * @return string
     */
    public function getTransactionGuid()
    {
		if (!isset($this->_data['transaction_guid'])) { return null; }
        return $this->_data['transaction_guid'];
    }
	
	/**
     * Возвращает route_id
     *
     * @return integer
     */
    public function getRouteId()
    {
        if (!isset($this->_data['route_id'])) { return null; }
        return $this->_data['route_id'];
    }
	
	/**
     * Возвращает parentGuid
     *
     * @return string
     */
    public function getParentGuid()
    {
        if (!isset($this->_data['parent_guid'])) { return null; }
        return $this->_data['parent_guid'];
    }
	
	/**
     * Возвращает virginPrice
     *
     * @return integer
     */
    public function getVirginPrice()
    {
        if (!isset($this->_data['virgin_price'])) { return null; }
        return $this->_data['virgin_price'];
    }
	
	/**
     * Возвращает serviceId
     *
     * @return string
     */
    public function getServiceId()
    {
        if (!isset($this->_data['service_id'])) { return null; }
        return $this->_data['service_id'];
    }
	
	/**
     * Возвращает serviceSmsPrefix
     *
     * @return string
     */
    public function getServiceSmsPrefix()
    {
        if (!isset($this->_data['service_sms_prefix'])) { return null; }
        return $this->_data['service_sms_prefix'];
    }
	
	/**
     * Возвращает callbackStatus
     *
     * @return string
     */
    public function getCallbackStatus()
    {
        if (!isset($this->_data['callback_status'])) { return null; }
        return $this->_data['callback_status'];
    }
	
	/**
     * Возвращает callbackAttemptCount
     *
     * @return string
     */
    public function getCallbackAttemptCount()
    {
        if (!isset($this->_data['callback_attempt_count'])) { return 0; }
        return $this->_data['callback_attempt_count'];
    }
	
	/**
     * Возвращает resultCode
     *
     * @return string
     */
    public function getResultCode()
    {
        if (!isset($this->_data['result_code'])) { return null; }
        return $this->_data['result_code'];
    }
	
	/**
     * Возвращает resultDescription
     *
     * @return string
     */
    public function getResultDescription()
    {
        if (!isset($this->_data['result_description'])) { return null; }
        return $this->_data['result_description'];
    }
	
	/**
     * Возвращает target
     *
     * @return string
     */
    public function getTarget()
    {
        if (!isset($this->_data['target'])) { return null; }
        return $this->_data['target'];
    }
	
	/**
     * Возвращает acceptingPaymentPartnerId
     *
     * @return integer
     */
    public function getAcceptingPaymentPartnerId()
    {
        if (!isset($this->_data['accepting_payment_partner_id'])) { return null; }
        return $this->_data['accepting_payment_partner_id'];
    }
	
	/**
     * Возвращает serviceType
     *
     * @return integer
     */
    public function getServiceType()
    {
        if (!isset($this->_data['service_type'])) { return null; }
        return $this->_data['service_type'];
    }
	
	/**
     * Возвращает reportStatus
     *
     * @return integer
     */
    public function getReportStatus()
    {
        if (!isset($this->_data['report_status'])) { return null; }
        return $this->_data['report_status'];
    }
	
	/**
     * Возвращает reportComment
     *
     * @return integer
     */
    public function getReportComment()
    {
        if (!isset($this->_data['report_comment'])) { return null; }
        return $this->_data['report_comment'];
    }
	
	/**
     * Возвращает callbackDelayedUntil
     *
     * @return string
     */
    public function getCallbackDelayedUntil()
    {
        if (!isset($this->_data['callback_delayed_until'])) { return null; }
        return $this->_data['callback_delayed_until'];
    }
	
    /**
     * Возвращает billingDelayedUntil
     *
     * @return string
     */
    public function getBillingDelayedUntil()
    {
        if (!isset($this->_data['billing_delayed_until'])) { return null; }
        return $this->_data['billing_delayed_until'];
    }
	
    /**
     * Возвращает billingStatus
     *
     * @return string
     */
    public function getBillingStatus()
    {
        if (!isset($this->_data['billing_status'])) { return null; }
        return $this->_data['billing_status'];
    }
	
    /**
     * Возвращает billingAttemptCount
     *
     * @return integer
     */
    public function getBillingAttemptCount()
    {
        if (!isset($this->_data['billing_attempt_count'])) { return 0; }
        return $this->_data['billing_attempt_count'];
    }
	
    /**
     * Возвращает callbackDescription
     *
     * @return string
     */
    public function getCallbackDescription()
    {
        if (!isset($this->_data['callback_description'])) { return null; }
        return $this->_data['callback_description'];
    }
	
	/**
     * Возвращает callbackCode
     *
     * @return string
     */
    public function getCallbackCode()
    {
        if (!isset($this->_data['callback_code'])) { return null; }
        return $this->_data['callback_code'];
    }
	
    /**
     * Возвращает category
     *
     * @return string
     */
    public function getCategory()
    {
        if (!isset($this->_data['category'])) { return null; }
        return $this->_data['category'];
    }
    
    /**
     * Возвращает partner_id
     *
     * @return string
     */
    public function getPartnerId()
    {
        if (!isset($this->_data['partner_id'])) { return null; }
        return $this->_data['partner_id'];
    }
    
    /**
     * Возвращает user_id
     *
     * @return string
     */
    public function getUserId()
    {
        if (!isset($this->_data['user_id'])) { return null; }
        return $this->_data['user_id'];
    }
    
    /**
     * Возвращает payment_id
     *
     * @return string
     */
    public function getPaymentId()
    {
        if (!isset($this->_data['payment_id'])) { return null; }
        return $this->_data['payment_id'];
    }
    
	/**
     * Увеличивает callbackAttemptCount
     *
     * @param string $count
     * @return Immo_MobileCommerce_Transaction
     */
	public function increaseCallbackAttemptCount($count = 1)
	{
		$this->_data['callback_attempt_count'] += $count;
	}
	
	/**
     * Увеличивает billingAttemptCount
     *
     * @param string $count
     * @return Immo_MobileCommerce_Transaction
     */
	public function increaseBillingAttemptCount($count = 1)
	{
		$this->_data['billing_attempt_count'] += $count;
	}
	
	/**
     * Возвращает sumServicePrecise
     *
     * @return integer
     */
    public function getSumServicePrecise()
    {
        if (!isset($this->_data['sum_service_precise'])) { return null; }
        return $this->_data['sum_service_precise'];
    }
    
    /**
     * Возвращает legend
     *
     * @return string
     */
    public function getLegend()
    {
        if (!isset($this->_data['legend'])) { return null; }
        return $this->_data['legend'];
    }

    /**
     * Возвращает cancelCode
     *
     * @return string
     */
    public function getCancelCode()
    {
        if (!isset($this->_data['cancel_code'])) { return null; }
        return $this->_data['cancel_code'];
    }

    /**
     * Возвращает cancelDescription
     *
     * @return string
     */
    public function getCancelDescription()
    {
        if (!isset($this->_data['cancel_description'])) { return null; }
        return $this->_data['cancel_description'];
    }

    public function getTranscriptedStatus()
    {
        return Immo_MobileCommerce_Transaction::staticGetTranscriptedStatus($this->getStatus());
    }
    
    public function getTranscriptedResultCode()
    {
        return Immo_MobileCommerce_Transaction::staticGetTranscriptedResultCode($this->getResultCode());
    }
    
    public static function staticGetTranscriptedStatus($status)
    {
        switch($status)
		{
			case Immo_MobileCommerce_Transaction::STATUS_WAIT:
				return "Ожидание";
			break;
			
            case Immo_MobileCommerce_Transaction::STATUS_READY_TO_INIT: 
            case Immo_MobileCommerce_Transaction::STATUS_INITING:
            case Immo_MobileCommerce_Transaction::STATUS_INIT_SUCCESS:
            case Immo_MobileCommerce_Transaction::STATUS_CHECK_SUCCESS:
            case Immo_MobileCommerce_Transaction::STATUS_CANCEL_FAILED:
                return "Проведение платежа";
            break;
            
            case Immo_MobileCommerce_Transaction::STATUS_CONFIRM_SUCCESS:
                return "Платеж проведен";
            break;
            
            case Immo_MobileCommerce_Transaction::STATUS_INIT_FAILED: 
            case Immo_MobileCommerce_Transaction::STATUS_CHECK_FAILED: 
            case Immo_MobileCommerce_Transaction::STATUS_CONFIRM_FAILED: 
            case Immo_MobileCommerce_Transaction::STATUS_CANCEL_SUCCESS:
                return "Платеж отменен";
            break;
        }
    }

    public static function staticGetTranscriptedResultCode($resultCode)
    {
        switch($resultCode)
        {
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_SERVICE_TEMPORARY_UNAVAILABLE:
                return "Сервис временно недоступен";
            break;
            
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_SERVICE_UNAVAILABLE :
                return "Услуга недоступна абоненту";
            break;
            
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_NO_MONEY :
                return "Недостаточно средств у абонента";
            break;
            
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_USER_ABORT_TRANSACTION :
                return "Абонент не подтвердил транзакцию";
            break;
            
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_LOW_BALANCE :
                return "После платежа остаток на счёте станет меньше минимального";
            break;
            
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_SYSTEM_ERROR :
            case Immo_MobileCommerce_Transaction::PAYMENT_CANCELLATION_RESULT_CODE_TIMEOUT :
                return "Техническая ошибка";
            break;
            
            default:
                return "";
            break;
        }
    }

    public function getResponseMessageFromParams()
    {
        $params = $this->getParamsArr();
        if (isset($params['msg'])) return $params['msg'];
        return null;
    }

    public function getServiceSumFromParams()
    {
        $params = $this->getParamsArr();
        if (isset($params['sum']) && is_numeric($params['sum'])) return $params['sum'];
        return null;
    }

    public function getProductIdFromParams()
    {
        $params = $this->getParamsArr();
        if (isset($params['account'])) return $params['account'];
        if (isset($params['product_id'])) return $params['product_id'];
        return null;
    }

    /**
     * Функция используется в процессинге Инплат и МобиДеньги для передачи идентификатора лицевого счета
     * @return int|null
     */
    public function getProductIdFromParamsOrTransactionId()
    {
        $params = $this->getParamsArr();
        if (isset($params['product_id'])) return $params['product_id'];
        else return $this->getId();
    }

    public function addToParams($key, $val)
    {

    }
}