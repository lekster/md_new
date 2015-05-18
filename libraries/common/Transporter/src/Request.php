<?php

/**
 * Интерфейс для работы с запросами im_Platform.
 * Интерфейс предоставляет доступ на чтение ко всем сущностям запроса платформы im_Platform, таким как: строка запроса (<b>ТЕЛО</b>), параметр запроса (<b>ПАРАМЕТР</b>) и опция запроса (<b>ОПЦИЯ</b>). 
 * <br><br><b>ТЕЛО</b><br>
 * Данные для обработки, введенные пользователем. Это может быть SMS или STK запрос, или инной вид запроса платформы. Для чтения тела запроса используется метод <b>get</b>. Без параметров, метод возвращает содержимое ТЕЛА. Если ТЕЛО запроса HTTP QUERY_STRING, то содержимое автоматически разбирается на набор полей и значений. Для доступа к ним, необходимо передавать имена полей в метод <b>get</b>. 
 * <br><br><b>ПАРАМЕТР</b><br>
 * Мета данные о запросе, такие как номер абонента (user-id), идентификатор сервиса (service-id) и прочие данные (см. ссылку). Для доступа к ним используется метод <b>getParam</b>. 
 * <br><br><b>ОПЦИЯ</b><br>
 * Пара данных ключ = значение, указанных при подключении сервиса. Опции передаются в запросе как ПАРАМЕТР с префиксом <b>opt_</b>. Для доступа к ОПЦИИ, используется метод <b>getOption</b>, при вызове которого не надо использовать префикс при указании имени ОПЦИИ.
 * 
 * <code>
 * $request = new ImPlatformClient_Request();
 * $msg = $request->get();
 * $msgParam = $request->get('s');
 * $param = $request->getParam('user-id');
 * $option = $request->getOption('conf');
 * $option = $request->getParam('opt_conf');
 * </code>
 * 
 * @link http://intranet.immo/imwiki/ImPlatform?v=12cn im_Platform
 * @link http://intranet.immo/imwiki/ImPlatform?v=12cn#h33-20 данные запроса im_Platform
 * @version 2.0.0
 * @copyright Inform-mobil 2007
 * @author vadim
 */
class ImPlatformClient_Request
{
    protected $param = array();
    protected $option = array();
    protected $msg = array();
    
    /**
     * Конструктор.
     * Разбирает запрос на ПАРАМЕТРЫ, ОПЦИИ и ТЕЛО запроса.
     */
    public function __construct()
    {
        foreach ($_REQUEST as $key => $value) {
            if (strstr($key, 'opt_')) {
                $this->option[substr($key, 4)] = $value;
            }
            $this->param[$key] = $value;
        }
        
        if (isset($_REQUEST['msg'])) {
        	parse_str($_REQUEST['msg'], $this->msg);
        }
    }
        
    /**
     * Возвращает ТЕЛО запроса или его параметр.
     * ТЕЛО передается как параметр msg запроса. ТЕЛО можно получить полностью - не указывая аргумент <b>name</b>, а также как переменную из HTTP QUERY_STRING, указав аргумент <b>name</b>, как имя переменной. Если указанной переменной не существует, возвращается NULL;
     * 
     * <code>
     * //ТЕЛО (?id4=test&s=p)
     * echo $request->get()."\n"; //?id4=test&s=p
     * echo $request->get('?id4')."\n"; //test
     * echo $request->get('s')."\n"; //p
     * echo $request->get('p')."\n"; //NULL
     * </code>
     * 
     * @param string $name имя переменной в QUERY_STRING тела запроса
     * @return string 
     */
    public function get($name = false)
    {
        if ($name) {
            return isset($this->msg[$name]) ?  $this->msg[$name] : NULL;
        } else {
            return $this->param['msg'];
        }
    }
    
    public function set($name, $value)
    {
    	$this->msg[$name] = $value;
    }
    
    /**
     * Возвращает ТЕЛО запроса в виде ассоциативного массива.
     * 
     * @return array
     */
    public function getMsg()
    {
        return $this->msg;
    }
    
    /**
     * Возвращает параметр запроса.
     * Если параметр отсутствует, возвращается NULL.
     * 
     * @param string $name имя параметра
     * @return string
     */
    public function getParam($name)
    {
        return isset($this->param[$name]) ?  $this->param[$name] : NULL;
    }
    
    /**
     * Устанавливает параметр запроса.
     * 
     * @param string $name
     * @param string $value
     * @return void 
     */
    public function setParam($name, $value)
    {
        $this->param[$name] = $value;
    }
    
    /**
     * Возвращает все параметры запроса.
     * 
     * @return array ассоциативный массив параметров
     */
    public function getParams()
    {
        return $this->param;
    }
    
    /**
     * Возвращает опцию запроса.
     * Если опция отсутствует, возвращается NULL.
     * 
     * @param string $name имя опции
     * @return string 
     */
    public function getOption($name)
    {
        return isset($this->option[$name]) ?  $this->option[$name] : NULL;
    }
    
    /**
     * Возвращает все опции запроса.
     * 
     * @return array ассоциативный массив опций
     */
    public function getOptions()
    {
        return $this->option;
    }
}

