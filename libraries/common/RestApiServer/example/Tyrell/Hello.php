<?php

namespace Tyrell;

use Tonic\Resource,
    Tonic\Response,
    Tonic\ConditionException;

/**
 * The obligitory Hello World example
 *
 * The @uri annotation routes requests that match that URL to this resource. Multiple
 * annotations allow this resource to match multiple URLs.
 *
 * @uri /hello
 * @uri /hello/:name
 * @uri /hello.fr/:name
 * @uri /hello.json/:name
 */
class Hello extends Resource
{
    /**
     * Use this method to handle GET HTTP requests.
     *
     * The optional :name parameter in the URL available as the first parameter to the method
     * or as a property of the resource as $this->name.
     *
     * Method can return a string response, an HTTP status code, an array of status code and
     * response body, or a full Tonic\Response object.
     *
     * @method GET
     * @param  str $name
     * @return str
     */
    public function sayHello($name = 'World', $name2 = 'tete')
    {
		//var_dump($this->params);
        return 'Hello '.htmlspecialchars(ucwords($name));
    }

    /**
     * @method GET
     * @lang fr
     * @param  str $name
     * @return str
     */
    public function sayHelloInFrench($name = 'Monde')
    {
		var_dump($this->params);
        return 'Bonjour '.htmlspecialchars(ucwords($name));
    }

    /**
     * The @priority annotation makes this method take priority over the above method.
     *
     * The custom @only annotation requires the matching class method to execute without
     * throwing an exception allowing the addition of an arbitary condition to this method.
     *
     * @method GET
     * @priority 2
     * @only deckard
     * @return str
     */
    public function replicants()
    {
        return 'Replicants are like any other machine - they\'re either a benefit or a hazard.';
    }

    /**
     * @method GET
     * @priority 2
     * @only roy
     * @return str
     */
    public function iveSeenThings()
    {
        return 'I\'ve seen things you people wouldn\'t believe.';
    }

    /**
     * Condition method for above methods.
     *
     * Only allow specific :name parameter to access the method
     */
    protected function only($allowedName)
    {
        if (strtolower($allowedName) != strtolower($this->name)) throw new ConditionException;
    }

    /**
     * The @provides annotation makes method only match requests that have a suitable accept
     * header or URL extension (ie: /hello.json) and causes the response to automatically
     * contain the correct content-type response header.
     *
     * @method GET
	 * @param  str $name
     * @provides application/json
     * @json
     * @return Tonic\Response
     */
    public function sayHelloComputer()
    {	
		var_dump($this->params);
        return new Response(200, array(
            'hello' => $this->name,
            'url' => $this->app->uri($this, $this->name)
        ));
    }

    /**
     * Condition method to turn output into JSON.
     *
     * This condition sets a before and an after filter for the request and response. The
     * before filter decodes the request body if the request content type is JSON, while the
     * after filter encodes the response body into JSON.
     */
    protected function json()
    {
        $this->before(function ($request) {
            if ($request->contentType == "application/json") {
                $request->data = json_decode($request->data);
            }
        });
        $this->after(function ($response) {
            $response->contentType = "application/json";
            if (isset($_GET['jsonp'])) {
                $response->body = $_GET['jsonp'].'('.json_encode($response->body).');';
            } else {
                $response->body = json_encode($response->body);
            }
        });
    }

    /**
     * All HTTP methods are supported. The @accepts annotation makes method only match if the
     * request body content-type matches.
     *
     * curl -i -H "Content-Type: application/json" -X POST -d '{"hello": "computer"}' http://localhost/www/tonic/web/hello.json
     * curl -i -H "Content-Type: application/json" -X POST -d '{"name": "computer"}' http://192.168.1.120/RestApiExample/tonic-master/example/web/hello.json
	 * curl -i -H "Content-Type: application/json" -X POST -d '{"name": "computer"}' http://192.168.1.120/RestApiExample/tonic-master/example/web/hello.json/456
	 * curl -i -H "Content-Type: application/json" -X POST -d '{"name": "computer"}' http://192.168.1.120/RestApiExample/tonic-master/example/web/hello.json/456
     * @method POST
	 * @param  str $name
     * @accepts application/json
     * @provides application/json
     * @json
     * @return Response
     */
    public function feedTheComputer($name = 'name123')
    {
		//var_dump($this->params);
		return new Response(200, array('123', $name));
        //return new Response(200, $this->request->data);
    }

}
