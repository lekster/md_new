<?php
/**
 * Class Immo_MobileCommerce_CacheFileHelper
 *
 * Позволяет кэшировать данные в файл с указанием времени жизни кэша в секундах.
 */

class Immo_MobileCommerce_CacheFileHelper
{
    protected $cacheDir;

    public function __construct($cacheDir)
    {
        $this->cacheDir = $cacheDir;
    }

    public function set($key, $data, $expire = 0)
    {
        $fileName = $this->cacheDir.'/'.$key;

        $resData = array(
            'data' => $data,
            'time' => time(),
            'expire' => $expire,
        );

        $cacheData = json_encode($resData);

        try
        {
            if(file_put_contents($fileName, $cacheData))
                return true;
            else
                return false;
        }
        catch (Exception $e)
        {
            var_dump($e->getMessage());
        }
    }

    public function get($key)
    {
        if(file_exists($this->cacheDir.$key))
        {
            $cache = json_decode(file_get_contents($this->cacheDir.$key), true);
            return new Immo_MobileCommerce_CacheFileItem($cache['data'], $cache['expire'], $cache['time']);
        }
        else
            return false;
    }

    public function delete($key)
    {

    }

    public function clear()
    {

    }
}


class Immo_MobileCommerce_CacheFileItem
{
    protected $data = null;
    protected $expire;
    protected $time;

    public function __construct($data, $time, $expire)
    {
        if($data)
            $this->data = $data;

        $this->time = $time;
        $this->expire = $expire;
    }

    public function getData()
    {
        return $this->data;
    }
    public function isExpired()
    {
        $isExpired = time() > $this->time + $this->expire;
        return $isExpired;
    }
}