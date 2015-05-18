<?php

require_once 'pbr-lib-common/src/Mapper/abstract.BaseMapper.php';
require_once 'pbr-lib-common/src/Entity/class.Product.php';

class Immo_MobileCommerce_ProductMapper extends Immo_MobileCommerce_BaseMapper
{
    protected $_productContainer = array();

    public function getById($id, $isCached = true)
    {
        if ($isCached == true && isset($this->_productContainer[$id]))
            return $this->_productContainer[$id];
        $sql = "SELECT * FROM \"".$this->_scheme."\".product WHERE product_id = ? LIMIT 1";
        $res = $this->_connection->query($sql, array($id));
        $ret = $this->_makeObject($res, 'Immo_MobileCommerce_Product');
        $this->_productContainer[$id] = $ret;
        return $ret;
    }
}