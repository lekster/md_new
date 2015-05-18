<?php

require_once 'pbr-lib-common/src/Entity/abstract.Entity.php';


class Immo_MobileCommerce_Processing extends Immo_MobileCommerce_Entity
{

    public function getId()
    {
        if (!isset($this->_data['processing_id'])) { return null; }
        return $this->_data['processing_id'];
    }
    
    public function setId($val)
    {
        $this->_data['processing_id'] = $val;
        return $this;
    }
    
    public function getName()
    {
        if (!isset($this->_data['processing_name'])) { return null; }
        return $this->_data['processing_name'];
    }

    public function setName($val)
    {
        $this->_data['processing_name'] = $val;
        return $this;
    }
    
    public function getIsActive()
    {
        if (!isset($this->_data['is_active'])) { return null; }
        return $this->_data['is_active'];
    }
    
    public function setIsActive($val)
    {
        $this->_data['is_active'] = $val;
        return $this;
    }
    
    
}
