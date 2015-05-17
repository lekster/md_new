<?php

require_once 'pbr-lib-common/src/Mapper/abstract.BaseMapper.php';
require_once 'pbr-lib-common/src/Entity/class.Transaction.php';

class Immo_MobileCommerce_TransactionMapper extends Immo_MobileCommerce_BaseMapper
{
    public function getByGuid($uuid)
    {
        $sql = 'SELECT * FROM "'.$this->_scheme.'"."transaction" AS t
                WHERE transaction_guid = ?
                LIMIT 1';
        $res = $this->_connection->query($sql, array($uuid));
        return $this->_makeObject($res, 'Immo_MobileCommerce_Transaction');
	}
}