<?php

require_once 'pbr-lib-common/src/Mapper/abstract.BaseMapper.php';
require_once 'pbr-lib-common/src/Entity/class.Partner.php';

class Immo_MobileCommerce_PartnerMapper extends Immo_MobileCommerce_BaseMapper
{
    protected $_partnerContainer = array();

    public function getById($id, $isCached = true)
    {
        if ($isCached == true && isset($this->_partnerContainer[$id]))
            return $this->_partnerContainer[$id];
        $sql = "SELECT * FROM \"".$this->_scheme."\".partner WHERE partner_id = ? LIMIT 1";
        $res = $this->_connection->query($sql, array($id));
        $ret = $this->_makeObject($res, 'Immo_MobileCommerce_Partner');
        $this->_partnerContainer[$id] = $ret;
        return $ret;
    }
}