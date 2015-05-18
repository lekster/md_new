<?php

require_once 'pbr-lib-common/src/Mapper/abstract.BaseMapper.php';
require_once 'pbr-lib-common/src/Entity/class.Service.php';

class Immo_MobileCommerce_ServiceMapper extends Immo_MobileCommerce_BaseMapper
{
    protected $_serviceContainer = array();

    public function getById($id, $isCached = true)
    {
        if ($isCached == true && isset($this->_serviceContainer[$id]))
            return $this->_serviceContainer[$id];
        $sql = "SELECT * FROM \"".$this->_scheme."\".service WHERE service_id = ? LIMIT 1";
        $res = $this->_connection->query($sql, array($id));
		$services = $this->_makeObject($res, 'Immo_MobileCommerce_Service');
        $this->_serviceContainer[$id] = $services;
        return $services;
    }
}