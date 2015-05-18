<?php

require_once 'pbr-lib-common/src/Mapper/abstract.BaseMapper.php';
require_once 'pbr-lib-common/src/Entity/class.Processing.php';

class Immo_MobileCommerce_ProcessingMapper extends Immo_MobileCommerce_BaseMapper
{
    protected $_container = array();

    public function getById($id, $isCached = true)
    {
        if ($isCached == true && isset($this->_container[$id]))
            return $this->_container[$id];
        $sql = "SELECT * FROM \"".$this->_scheme."\".processing WHERE processing_id = ? LIMIT 1";
        $res = $this->_connection->query($sql, array($id));
        $ret = $this->_makeObject($res, 'Immo_MobileCommerce_Processing');
        $this->_container[$id] = $ret;
        return $ret;
    }
}