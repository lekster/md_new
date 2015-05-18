<?php

require_once 'pbr-lib-common/src/ServiceLocator/class.ServiceLocator.php';
require_once 'pbr-lib-common/src/Helper/class.TemplateHelper.php';
require_once 'pbr-lib-common/src/Helper/class.DataStoreHelper.php';
require_once 'pbr-lib-common/src/Caller/class.Caller.php';

class Immo_MobileCommerce_Helper_RoutePlannerDb
{
	const SEARCH_TYPE_ORDER = 1;		//поиск ведется по порядку
	const SEARCH_TYPE_ORDER_ID = 2; 	//поиск ведется по порядку, начиная с определнного id маршрута
	const SEARCH_TYPE_BALANCE = 3;		//поиск ведется с учетом балансировок - МЕТОД ПО УМОЛЧАНИЮ
	const SEARCH_TYPE_BALANCE_ID = 4;	//поиск ведется с учетом балансировок, начиная с определнного id маршрута
	
	protected $_operator;
	protected $_productId;
	protected $_price;
	protected $_logger;
	protected $_config;
	protected $_serviceLocator;
	protected $_facade;
	protected $_routeResult = array();
	protected $_realPrice;
	protected $_strictPrice;
	protected $_msisdn;
	protected $_addParams;
	protected $_searchMethod;
	protected $_route;
	protected $_parentGuid;

	public function __construct($operator, $productId, $price, $msisdn = '', $addParams = array(), $parentGuid = false, $searchMethod = array('type'=>self::SEARCH_TYPE_BALANCE, 'routeId'=>false))
	{
		$this->_operator = $operator;
		$this->_productId = $productId;
		$this->_price = $price;
		$this->_realPrice = $price;
		$this->_strictPrice = $price;
		$this->_msisdn = $msisdn;
		$this->_serviceLocator = Immo_MobileCommerce_ServiceLocator::getInstance();
		$this->_logger = $this->_serviceLocator->getLogger();
		$this->_config = $this->_serviceLocator->getConfig();
		$this->_facade = $this->_serviceLocator->getFacade();
		$this->_addParams = $addParams;
		$this->_parentGuid = $parentGuid;
		/*
		* searchMethod - массив, которым задается метод поиска (нужен для переотправки) бывает четырех видов:
		* array('type'=>1, 'routeId'=>false)
		* array('type'=>2, 'routeId'=>34)
		* array('type'=>3, 'routeId'=>false)
		* array('type'=>4, 'routeId'=>52)
		*/
		$this->_searchMethod = $searchMethod;
		// Сразу рассчитываем маршрут
		$this->_route = $this->calculateRoute();
		$this->_logger->info('FOUND ROUTE', $this->_route);
	}
	
	protected function calculateRoute()
	{
		// Получаем карту продукта (параметры маршрута)
		$productMap = $this->_facade->getProductMap($this->_productId);
		$this->_logger->info('CALCULATING ROUTE FOR PRODUCT WITH ID: '.$this->_productId);
		if ($productMap)
		{
			$mapPriority = array();
			// Раскидываем параметры по приоритетам и сервисам
			foreach($productMap as $param)
			{
				$mapPriority[$param['priority']][$param['service_id']]['service_id'] = $param['service_id'];
				$mapPriority[$param['priority']][$param['service_id']]['ps_id'] = $param['ps_id'];
				if(!empty($param['route_params_type_name']))
					$mapPriority[$param['priority']][$param['service_id']]['params'][$param['route_params_type_name']] = json_decode($param['value'],true);
			}
			// На выходе получаем массив приоритетов, каждый элемент которого является массивом маршрутов (может быть несколько равнозначных по приоритету маршрутов, т.е. сервисов)
			$this->_logger->debug('PRODUCT MAP PRIORITY', $mapPriority);
			// Пропускаем получившийся массив, через проверку маршрутов, чтобы остались только подходящие по параметрам маршруты, через которые транзакция может реально пройти
			$posibleSamePriorityRoutes = $this->checkEveryRoute($mapPriority);
			$this->_logger->debug('POSIBLE PRIORITY ROUTES', $posibleSamePriorityRoutes);
			// Теперь у нас есть проходные для текущей транзакции маршруты, сгрупированные по приоритету
			$theChosenOne = $this->findRoute($posibleSamePriorityRoutes);
			// На случай если типы были с указанием конкретного id, а потом например его отключили, но проходные маршруты все равно есть
			// т.е. он ищет группу баланса в которой есть данный id, чтобы перейти на следуюющую группу, но не может найти - тогда меняем тип и идем заново
			if($this->_searchMethod['type'] == self::SEARCH_TYPE_ORDER_ID)
			{
				// может случиться только тогда, когда theChosenOne = null, ибо при удачном исходе в конечном итоге тип должен быть без ID
				$this->_searchMethod['type'] = self::SEARCH_TYPE_ORDER;
				$theChosenOne = $this->findRoute($posibleSamePriorityRoutes);
			}
			elseif($this->_searchMethod['type'] == self::SEARCH_TYPE_BALANCE_ID)
			{
				// может случиться только тогда, когда theChosenOne = null, ибо при удачном исходе в конечном итоге тип должен быть без ID
				$this->_searchMethod['type'] = self::SEARCH_TYPE_BALANCE;
				$theChosenOne = $this->findRoute($posibleSamePriorityRoutes);
			}
			if(!$theChosenOne)
				$this->_logger->info("CORRECT ROUTE NOT FOUND");
			return $theChosenOne;
		}
		else
		{
			// косяк привязки: ничего не привязано к продукту
			$this->_logger->error("PRODUCT MAP NOT FOUND (CHECK PRODUCT_SERVICES TABLE)- " . $this->_productId);
			return null;
		}
	}
	
	protected function checkEveryRoute($mapPriority)
	{
		$posibleSamePriorityRoutes = array();
		foreach($mapPriority as $priority=>$samePriorityRoutes)
		{
			$this->_logger->debug('CHECKING PRIORITY', $priority);
			foreach ($samePriorityRoutes as $serviceId=>$route)
			{
				if(!empty($route['params']))
				{
					if($this->routeChecker($route['params']))
						$posibleSamePriorityRoutes[$priority][$serviceId] = $route;
				}
				else
					$posibleSamePriorityRoutes[$priority][$serviceId] = $route;
			}
		}
		return $posibleSamePriorityRoutes;
	}
	
	protected function findRoute($posibleSamePriorityRoutesDiminishing)
	{
		while(!empty($posibleSamePriorityRoutesDiminishing))
		{
			// Начиная с самых приоритетных ищем тот самый, по которому пойдет в итоге транзакция
			$currentRoutes = array_shift($posibleSamePriorityRoutesDiminishing);
			// Сортируем маршруты по порядку заведения сервисов в БД
			ksort($currentRoutes);
			// Производим поиск маршрута с учетом заданного метода
			$theChosenOne = $this->findRouteBySpecifiedMethod($currentRoutes);
			// Если ничего не нашлось, переходим к следующей группе сервисов, согласно приоритету
			if(!$theChosenOne)
			{
				$this->_logger->debug("THERE IS NO CORRECT ROUTE FOR CURRENT PRIORITY => GOING TO NEXT PRIORITY GROUP");
				continue;
			}
			// Возвращаем избранный маршрут
			return $theChosenOne;	
		}
		$this->_logger->debug("COULD NOT FIND CORRECT ROUTE FOR SUCH METHOD");
		return null;
	}
	
	protected function findRouteBySpecifiedMethod($currentRoutes)
	{
		$this->_logger->debug("SEARCH METHOD",$this->_searchMethod);
		switch($this->_searchMethod['type'])
		{
			case self::SEARCH_TYPE_ORDER:
				// Если выбран метод поиска по порядку, то просто возвращаем первый по порядку маршрут
				return array_shift($currentRoutes);
				break;
			case self::SEARCH_TYPE_ORDER_ID:
				// Если выбран метод поиска по порядку, начиная с определенного id
				while(true)
				{
					// Берем по порядку каждый маршрут
					$regularRoute = array_shift($currentRoutes);
					if($regularRoute['ps_id'] == $this->_searchMethod['routeId'])
					{
						/* 
						* Если текущий маршрут и является тем с которого нужно продолжать, меняем тип на по порядку
						* Это нужно в случае, если указанный сервис идет последним в группе баласна
						* Тогда в новой группе баланса нужно брать первый по порядку
						*/
						$this->_searchMethod['type'] = self::SEARCH_TYPE_ORDER;
						break;
					}
					// Если в группе баланса уже ничего не осталось, выходим из цикла
					if(empty($currentRoutes))
						break;	
				}
				// Возвращаем следующий маршрут (если группа уже пуста, это будет null, что позволит нам перейти к следующей группе баланса)
				return array_shift($currentRoutes);
				break;
			case self::SEARCH_TYPE_BALANCE:
				// Если выбран метод поиска с балансировкой - отправляем на балансер
				$result = $this->balance($currentRoutes);
				return $result;
				break;
			case self::SEARCH_TYPE_BALANCE_ID:
				/*
				* Если выбран метод поиска с балансировкой, начиная с определенного id,
				* нам обязательно нужно пропустить ту группу балансировки в которой находится указанный id
				* дабы избежать повторного распределния балансером на этот же маршрут
				*/
				while(true)
				{
					// Берем по порядку каждый маршрут
					$regularRoute = array_shift($currentRoutes);
					if($regularRoute['ps_id'] == $this->_searchMethod['routeId'])
					{
						/* 
						* Если текущий маршрут и является тем с которого нужно продолжать, меняем тип на обыкновенную балансировку
						* и отправляем на следующий этап
						* то есть вернется он уже с новой группой баланса и там будет просто балансить, без id
						*/
						$this->_searchMethod['type'] = self::SEARCH_TYPE_BALANCE;
						break;
					}
					// Если в группе баланса уже ничего не осталось, выходим из цикла. Это означает, что
					// мы прошлись по группе и не нашли id, с которого нужно продолжать => переходим на другую группу балансировки
					if(empty($currentRoutes))
						break;
				}
				return null;
				
			default:
				// Если попали сюда - случился какой-то косяк и мы не знаем такого метода для поиска
				$this->_logger->error("INTERNAL ERROR: WRONG SEARCH TYPE");
				return null;
		}
	}
	
	protected function balance($currentRoutes)
	{
		// Формируем имя файла кеша: имя продукта + id всех проходных сервисов в группе балансинга + ps_id из базы (пример - хэш от "mblztr:34,52,53[151,152,153]")
		$psIds = array();
		foreach($currentRoutes as $value)
		{
			if(!empty($value['ps_id']))
				$psIds[] = $value['ps_id'];
		}
		$readableDataName = $this->_productId.':'.implode(",",array_keys($currentRoutes)).'['.implode(",",$psIds).']';
		$storedBalanceDataName = md5($readableDataName);
		$this->_logger->debug("CURRENT CASH FILENAME GENERATED FROM: $readableDataName", $storedBalanceDataName);
		// Создаем объект работы с файлами кэша
		$storageHelper = new Immo_MobileCommerce_Helper_DataStoreHelper($storedBalanceDataName);
		// Получаем массивчик балансировки (согласно ему и будут балансится по процентам сервисы)
		if(!$storageHelper->isExists())
		{
			// Если файл не существует, или существует, но пустой (системный сбой), то создаем его, а массивчик балансировки собираем
			$storageHelper->create();
			$balanceData = $this->getBalanceData($currentRoutes);
		}
		else
		{
			// Если же файл существует, то просто берем оттуда данные и разджейсоневаем (поидее должен получиться массивчик балансировки)
			$balanceData = json_decode($storageHelper->get());
		}
		$this->_logger->debug("CURRENT BALANCE ARRAY", $balanceData);
		// Если не получилось вытащить/cгенерировать массив, значит что-то пошло не так, выдаем ошибку и читаем коды =)
		if(!is_array($balanceData))
		{
			$this->_logger->error("INTERNAL ERROR: CAN NOT GENERATE BALANCE ARRAY");
			return null;
		}
		// Если полученный массив получился сразу пустым - значит веса у всех проходных сервисов выставлены в ноль => проходного в данной группе нет, идем дальше
		if(empty($balanceData))
		{
			$this->_logger->info("ALL ROUTS IN CURRENT BALANCE GROUP HAVE 0 WEIGHT");
			return null;
		}
		// Вырезаем первый элемент из массива балансировки - он и будет являться нашим проходным сервисом
		$serviceIdToGo = array_shift($balanceData);
		/*
		* Если после ампутации не осталось ни одного элемента, удаляем файлик кэша => в следующий раз балансировка пойдет заново (прошли все 100 транзакций/процентов)
		* Иначе переписываем файл кэша и кладем туда остатки массивчика балансировки
		*/
		if(count($balanceData)==0)
			$storageHelper->delete();
		else
			$storageHelper->set(json_encode($balanceData));
		// Имея проходной сервис, нужно проверить еще раз: существует ли сейчас такой маршрут и проходной ли он для нашей транзакции, ибо правила могли поменяться
		if(empty($currentRoutes[$serviceIdToGo]) || !(empty($currentRoutes[$serviceIdToGo]['params']) || $this->routeChecker($currentRoutes[$serviceIdToGo]['params'])))
		{
			// Если что-то изменилось, удаляем кэш и отправляем на пересчет маршрута (ВНИМАНИЕ! ОПАСНОСТЕ! РЕКУРСИЯ!)
			$this->_logger->debug("SERVICE ID ($serviceIdToGo) DEPRECATED => NEED TO RECALCULATE ROUTE");
			$storageHelper->delete();
			$this->calculateRoute();
		}
		// Если все ок, возвращаем проходной маршрут, для создания транзакции
		return $currentRoutes[$serviceIdToGo];
	}
	
	protected function getBalanceData($currentRoutes)
	{
		// Счетчик маршрутов, у которых не указано значение балансировки
		$unBalancedRoutesCount = 0;
		// Сумма значений балансировок сервисов, у которых оно указано
		$sumPercent = 0;
		// Заводим пустой массивчик баланса
		$routesBalance = array();
		// Для каждого маршрута в группе баланса
		foreach($currentRoutes as $serviceId=>$data)
		{
			if(!isset($data['params']['Balancer']))
			{
				// Если не указано значение блокировки, увеличиваем количство таких маршрутов
				$unBalancedRoutesCount++;
				// Добавляем этот маршрут пока с нулевым значением
				$routesBalance[$serviceId] = 0;
			}
			else
			{
				// Если же указано - добавляем этот маршрут с этим значением
				$routesBalance[$serviceId] = $data['params']['Balancer'];
				// И плюсуем общий процент балансировки
				$sumPercent += $data['params']['Balancer'];
			}
		}
		// Если есть маршруты без значения балансировки, и есть чего им рапределить (то есть у всех укзанных меньше 100%)
		if($unBalancedRoutesCount>0 && $sumPercent<100)
		{
			// Считаем процент, который надо размазать
			$unBalancedPercent = 100 - $sumPercent;
			// Берем целые части, которые точно достануться всем
			$spreadedPercent = floor($unBalancedPercent/$unBalancedRoutesCount);
			// Считаем остаток который неполучается размазать (его мы раздадим просто по порядку следования маршрутов)
			$modulo = $unBalancedPercent-$spreadedPercent*$unBalancedRoutesCount;
			// Идем по всем маршрутам
			foreach ($routesBalance as $serviceId=>$percent)
			{
				// Смотрим только на те, которые без значения (по ним и будем размазывать)
				if($percent==0)
				{
					// Заводим переменную, в которой будем хранить распределяемое по порядку
					$extraPercent = 0;
					if($modulo>0)
					{
						// если распределяемое по порядку еще есть, отщипываем от него целый процент и отдаем текущему сервису
						$modulo--;
						$extraPercent++;
					}
					// размазываем остатки по маршрутам, добавляя распределяемое по порядку
					$routesBalance[$serviceId] = $spreadedPercent + $extraPercent;
				}
			}
		}
		/*
		* Генерируем массивчик из id сервисов, которые находятся в группе балансировки (100 элементов = 100 процентов)
		* Заполняем его по пордяку следования сервисов, в процентном соотношении с их значениями балансировки
		* Получается id сервиса встретиться в массиве столько раз, сколько процентов ему отведено
		*/
		$counter = 0;
		$balanceData = array();
		foreach($routesBalance as $serviceId=>$percent)
		{
			for($i=0;$i<$percent;$i++)
			{
				if($counter==100)
					break 2;
				$balanceData[]=$serviceId;
				$counter++;
			}
		}
		// Перемешиваем его, чтобы обеспечить случайность балансировки
		shuffle($balanceData);
		// И возвращаем
		return $balanceData;
	}
	
	protected function routeChecker($routeParams)
	{
		// Костыльная кастомизация для эротики - запросов без номера телефона => без оператора (проверки не нужны)
		if($this->_operator)
		{
			// Проверяем оператора
			$correctOp = $this->operatorChecker($routeParams);
			if(!$correctOp)
			{
				$this->_logger->debug('OPERATOR NOT FOUND => GOING TO NEXT ROUTE');
				return false;
			}
			//Проверяем оператора от противного
			$correctOpExcept = $this->operatorExceptChecker($routeParams);
			if(!$correctOpExcept)
			{
				$this->_logger->debug('OPERATOR FOUND IN EXCEPT => GOING TO NEXT ROUTE');
				return false;
			}
		}
		// Проверяем на принадлежность к блеклисту
		$allowed = $this->listChecker($routeParams);
		if(!$allowed)
		{
			// Если запись найдена в списке запрещенных абонов для этого маршрута
			$this->_logger->debug('FOUND IN BLACK LIST => GOING TO NEXT ROUTE');
			return false;
		}
		// Проверяем на отсутствие в списке (обратное дейстиве "принадлежности к блеклисту")
		$allowed = $this->listChecker($routeParams, $reverse = true);
		if(!$allowed)
		{
			// Если запись не найдена в списке разрешенных абонов для этого маршрута
			$this->_logger->debug('NOT FOUND IN ACCESS LIST => GOING TO NEXT ROUTE');
			return false;
		}
		// Проверяем проходит ли по последнему коду ошибки - ищем в списке запретных кодов
		$allowedCode = $this->codesChecker($routeParams);
		if(!$allowedCode)
		{
			// Если запись найдена в списке запрещенных кодов для этого маршрута
			$this->_logger->debug('FOUND IN DENIED CODES => GOING TO NEXT ROUTE');
			return false;
		}
		// Проверяем проходит ли по последнему коду ошибки - ищем в списке разрешенных кодов (обратное предыдущему)
		$allowedCode = $this->codesChecker($routeParams, $reverse = true);
		if(!$allowedCode)
		{
			// Если запись не найдена в списке разрешенных кодов для этого маршрута
			$this->_logger->debug('NOT FOUND IN ALLOWED CODES => GOING TO NEXT ROUTE');
			return false;
		}
		// Проверяем цену
		$price = $this->priceConditionChecker($this->_price, $routeParams);
		$anyPrice = $this->isAnyPriceAvailable($routeParams);
		if (is_null($price) && $anyPrice)
		{
			$this->_logger->debug('PRICE WAS NOT AVAILABLE, BUT ANYPRICE FLAG WAS FOUND');
			$price = $this->_price;
		}
		$this->_realPrice = $price;
		$this->_logger->debug('realPrice', $this->_realPrice);
		if (is_null($price))
		{
			$this->_logger->debug('PRICE NOT FOUND => GOING TO NEXT ROUTE');
			return false;
		}
		// Проверяем на первичность, т.е. принимал ли уже акцепт данный абон
		$isUserConfirmPayment = $this->storedPaymentUserChecker($this->_msisdn, $routeParams);		
		if (!$isUserConfirmPayment)	
		{
			$this->_logger->debug('STORED USER NOT FOUND => GOING TO NEXT ROUTE');
			return false;
		}
		// Проверяем на наличие файла-семафора
		$semaphore = $this->semaphoreChecker($routeParams);
		if (!$semaphore)
		{
			$this->_logger->debug('SEMAPHORE FILE NOT FOUND => GOING TO NEXT ROUTE');
			return false;
		}
			
		return true;
	}
	
	protected function operatorChecker($routeParams)
	{
		$operatorId = $this->_operator->getId();
		$operatorGroupId = $this->_operator->getOperatorGroupId();
		$isCorrectOp = isset($routeParams['OperatorId']) && in_array($operatorId, $routeParams['OperatorId']);
		$isCorrectOpGroup = isset($routeParams['OperatorGroupId']) && in_array($operatorGroupId, $routeParams['OperatorGroupId']);
		$isOpEmpty = !isset($routeParams['OperatorId']);
		$isOpGroupEmpty = !isset($routeParams['OperatorGroupId']);
		if($isCorrectOp || $isCorrectOpGroup || ($isOpEmpty && $isOpGroupEmpty) )
			return true;
		$this->_logger->debug("OPERATOR GROUP ID: $operatorGroupId, OPERATOR ID: $operatorId");
		return false;
	}

	 protected function operatorExceptChecker($routeParams)
    {
        $res = true;
        if(isset($routeParams['OperatorIdExcept'])){
            $operatorId = $this->_operator->getId();
            if(isset($routeParams['OperatorIdExcept']) && in_array($operatorId, $routeParams['OperatorIdExcept'])){
                $res = false;
            }
        }
        if(isset($routeParams['OperatorGroupIdExcept'])){
            $operatorGroupId = $this->_operator->getOperatorGroupId();
            if(isset($routeParams['OperatorGroupIdExcept']) && in_array($operatorGroupId, $routeParams['OperatorGroupIdExcept'])){
                $res = false;
            }
        }
        return $res;
    }
	
	protected function listChecker($routeParams, $reverse = false)
	{
		// По умолчанию работаем с блэк листом
		$paramNameForList = 'DenyByBlackList';
		// Если же есть флаг reverse - работаем с белыми списками
		if($reverse)
			$paramNameForList = 'AccessList';
		if (!empty($routeParams[$paramNameForList]))
		{
			$blackListUrl = $this->_config->get('BlackList', 'FraudLinks');
			foreach($routeParams[$paramNameForList] as $fraudServiceName)
			{
				if(!isset(${$fraudServiceName}))
					${$fraudServiceName} = array();
				// Проверяем закэшен ли данный абонент
				if(!in_array($this->_msisdn,${$fraudServiceName}))
				{
					// Если в кэше не нашли делаем запрос
					$curentUrl = $blackListUrl.$fraudServiceName.'/'.$this->_msisdn;
					$curl = new Caller($curentUrl);
					$requestResult = $curl->Call();
					if($requestResult === null)
					{
						// Запрос не прошел - возвращаем ничего
						$code = $curl->getLastErrorCode();
						$desc = $curl->getLastErrorDesc();
						$this->_logger->error("CHECK LIST CURL REQUEST FAILED: $desc (code:$code)", $curentUrl);
						continue;
					}
					$res = json_decode($requestResult,true);
					// Если абонент нашелся в списке, но еще не в кеше - кэшим
					if(isset($res['ResponseCode']) && $res['ResponseCode']==1)
						${$fraudServiceName}[] = $this->_msisdn;
				}
				else
					$res['ResponseCode']=1; //если нашли в кеше
				if(!isset($res['ResponseCode']))
					return false; //если запрос к спискам не прошел - делаем непроходным
				elseif($res['ResponseCode']==1 && !$reverse)
					return false; //если нашелся в черном списке - делаем непроходным
				elseif($res['ResponseCode']==0 && $reverse)
					return false; //если не нашелся в белом списке - делаем непроходным
			}
		}
		return true;
	}
	
	protected function codesChecker($routeParams, $reverse = false)
	{
		// По умолчанию работаем с запрещенными кодами
		$paramNameForCodes = 'DeniedCodes';
		// Если же есть флаг reverse - работаем с разрешенными кодами
		if($reverse)
			$paramNameForCodes = 'AllowedCodes';
		// Если такой параметр установлен и существует parentGuid (т.е. маршрут строится уже для переотправки)
		if (!empty($routeParams[$paramNameForCodes]) && $this->_parentGuid)
		{
			$res = $this->_facade->getLastProcessingResultCodeByParentGuid($this->_parentGuid);
			if(!$res)
				return false; //если запрос на получение последнего кода не прошел - делаем непроходным
			foreach($routeParams[$paramNameForCodes] as $code)
			{
				// Для каждого кода смотрим есть ли уточнение по процессингу (указывается как префикс через "_")
				$parts = explode('_',$code);
				if(isset($parts[1]))
				{
					// Если указан конкретный процессинг, то сравниваем и с кодом, и с процессингом
					$matchResult = ($parts[0]==$res['processing_id'] && $parts[1]==$res['result_code']);
				}
				else
				{
					// Если процессинг не указан - сравниваем с кодом
					$matchResult = ($parts[0]==$res['result_code']);
				}
				if($matchResult && !$reverse)
					return false; //если нашелся в списке недопустимых кодов - делаем непроходным
				elseif(!$matchResult && $reverse)
					return false; //если не нашелся в списке разрешенных кодов - делаем непроходным
			}
		}
		return true;
	}
	
	protected function priceConditionChecker($price, $routeParams)
	{
		$this->_logger->debug('price', $price);
		$this->_logger->debug('routeParams', $routeParams);
		if (!empty($routeParams["Price"]))
		{
			//Выбираем подходящие цены учитывая самый большой коридор цен
			$availablePrices = array();
			foreach($routeParams["Price"] as $strictPrice=>$modifyPrice)
			{
				// По умолчанию цена одна
				$minPrice = $maxPrice = $strictPrice;
				// Проверяем включен ли коридор с указанием смещения границ в конкретных значениях
				if(!empty($routeParams["PriceBandVal"]))
				{
					$minPrice = $strictPrice-$routeParams["PriceBandVal"];
					$maxPrice = $strictPrice+$routeParams["PriceBandVal"];
				}
				// Проверяем включен ли коридор с указанием смещения границ в процентах
				if(!empty($routeParams["PriceBandPercent"]))
				{
					$min = $strictPrice-$strictPrice*$routeParams["PriceBandPercent"]/100;
					if($minPrice>$min)
						$minPrice = $min;
					$max = $strictPrice+$strictPrice*$routeParams["PriceBandPercent"]/100;
					if($maxPrice<$max)
						$maxPrice = $max;
				}
				$this->_logger->debug('PRICE BAND FOR '.$strictPrice, $minPrice.' - '.$maxPrice);
				if($price>=$minPrice && $price<=$maxPrice)
				{
					$availablePrices[] = array(
						'strict' => $strictPrice,
						'modify' => $modifyPrice,
					);
					$this->_logger->debug('PRICE '.$price.' IS AVAILABLE AS '.$modifyPrice);
				}
			}
			if(empty($availablePrices))
				return null;
			if(isset($availablePrices[1]))
			{
				$this->_logger->error('PRICE BAND INTERSECTION',$availablePrices);
				return null;
			}
			$this->_strictPrice = $availablePrices[0]['strict'];
			return $availablePrices[0]['modify'];
		}
		return $price;
	}
	
	protected function isAnyPriceAvailable($routeParams)
	{
		if(isset($routeParams['AnyPrice']))
			return $routeParams['AnyPrice'];
		return false;
	}
	
	protected function storedPaymentUserChecker($msisdn, $routeParams)
	{			
		if (!empty($routeParams["ConfirmPaymentUser"]))
		{
			$confirmCondition = $routeParams["ConfirmPaymentUser"];
			$paymentId = (array_key_exists("payment_id", $confirmCondition)) ? $confirmCondition['payment_id'] : '';
			$paymentId = Immo_MobileCommerce_Helper_TemplateHelper::processTemplate($paymentId, $this->_addParams);
			$serviceId = (array_key_exists("service_id", $confirmCondition)) ? $confirmCondition['service_id'] : '';
			$this->_logger->debug("storedPaymentUserChecker PARAMS - " . $paymentId . "|" . $serviceId);
			$result = $this->_facade->checkPaymentUser($msisdn, $serviceId, $paymentId);
			$this->_logger->debug("CHECK RESULT - " . $result);
			if (!$result)
				return false;
		}
		return true;
	}
	
	protected function semaphoreChecker($routeParams)
	{
		if (!empty($routeParams["Semaphore"]))
		{
			if(file_exists($routeParams["Semaphore"]))
				return true;
			else
				return false;
		}
		return true;
	}
	
	public function getRoute()
	{
		if(empty ($this->_route))
			return false;
		return $this->_route;
	}
	
	public function getServiceId()
	{
		if(empty($this->_route['service_id']))
			return false;
		return $this->_route['service_id'];
	}
	
	public function getPsId()
	{
		if(empty($this->_route['ps_id']))
			return false;
		return $this->_route['ps_id'];
	}
	
	public function getAdditionalParams($transactionGuid = false)
	{
		if(!$transactionGuid)
			$transactionGuid = uuid_create();
		$additionalParamsArr = array('transactionGuid' => $transactionGuid);
		$routeAdditionalParamsArr = empty($this->_route['params']['AdditionalParams']) ? array() : $this->_route['params']['AdditionalParams'];
		// Тут важен приоритет мерджа, т.к. последним должен идти свежесозданный гуайдишник, ибо если он создается - значит должен быть использован
		return array_merge($routeAdditionalParamsArr, $this->_addParams, $additionalParamsArr);
	}
	
	public function getPriceCorrection()
	{
		if(!empty($this->_route['params']['PriceCorrection'])) 
			return $this->_route['params']['PriceCorrection']/100;			
		return 0;
	}
	
	public function isNeedToCalculateServiceFee()
	{
		if(isset($this->_route['params']['CalculateServiceFee']))
			return $this->_route['params']['CalculateServiceFee'];
		return true;
	}
	
	public function getSumUserPrice($service, $operator)
	{
		if(!empty($this->_realPrice))
			$price = $this->_realPrice;
		else
			$price = $this->_price;
		if(!$price)
			return false;
		$this->_logger->debug('PRICE', $price);
		$price = (float)$price / 100;
		$this->_logger->debug('PRICE REAL', $price);
		
		if ($this->isNeedToCalculateServiceFee())
		{
			try
			{
				$fees = $this->_facade->getServiceFeeCollectionByServiceAndOperator($service, $operator);
				return $price / ((1 + $fees->getByType(Immo_MobileCommerce_ServiceFee::TYPE_BANK_USER)->getValue() / 100) *
								(1 + $fees->getByType(Immo_MobileCommerce_ServiceFee::TYPE_PBSOL_USER)->getValue() / 100));
			}
			catch(Exception $e)
			{
				$this->_logger->fatal('EXCEPTION SAID', $e);
				return false;
			}
		}
		else
			return $price;
	}

	public function getRealPriceWithoutFee()
	{
		return $this->_realPrice;
	}
	
	public function getStrictPrice()
	{
		return $this->_strictPrice;
	}
}