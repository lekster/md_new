<?php

require_once 'pbr-lib-common/src/Mapper/abstract.BaseMapper.php';
require_once 'pbr-lib-common/src/Entity/class.User.php';

class Immo_MobileCommerce_UserMapper extends Immo_MobileCommerce_BaseMapper
{
    protected $_userContainer = array();

    public function getById($id, $isCached = true)
    {
        if ($isCached == true && isset($this->_userContainer[$id]))
            return $this->_userContainer[$id];
        $sql = "SELECT * FROM \"".$this->_scheme."\".users WHERE user_id = ? LIMIT 1";
        $res = $this->_connection->query($sql, array($id));
        $ret = $this->_makeObject($res, 'Immo_MobileCommerce_User');
        $this->_userContainer[$id] = $ret;
        return $ret;
    }
}