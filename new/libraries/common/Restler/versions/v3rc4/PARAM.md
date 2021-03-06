# @param and @var

Following attributes can be used with `@param`, they apply for `@var` comment
that is added to model class properties. Just replace 

    @param [type] $name ...

with 

    @var [type] ...

in the examples below

## @from

Syntax:

    @param [type] $name [Description] {@from url|body|query|head}
    
Example:

    @param string $name user name {@from body}

override parameter mapping, define where to expect the parameter from. Value should be one of the following

 - path as part of url
 - query as part of the query string
 - body as part of the body of the request
 - head as part of the http header
 
Please note that unlike path and head other values are only suggestive and primarly used by API Explorer to build the interface
    
## @type

Syntax:

### string

    @param string $name [Description] {@type email|date|datetime|timestamp}

### array
 
    @param array  $name [Description] {@type className}
    
Examples:

    @param string $email email id {@type email}
    
sub types for validation and documentation purpose. email will validate the given string as email. date, datetime, and timestamp will be validated as standard mysql date formats respectively

    @param array $author array of Authors {@type Author}
    
States that the given array of Author instances. 

Take a look at [Type API Class](public/tests/param/Type.php) and tests in [type.feature](features/tests/param/type.feature)

## @choice

Syntax:

	@param string $name [Description] {@choice option1,option2...}
	
Example:

	@param string $gender {@choice male,female,third}

Value for the parameter should match one of the choices, used for validation

## @min and @max

Syntax:

	@param string|int|float|array $name [Description] {@min value}{@max value}

Examples:

### string
	@param string $name 3 to 10 characters in length {@min 3}{@max 10}
### array
	@param array $items at least one item is needed  {@min 1}
### integer
	@param int $age valid age should be 18 or above  {@min 18}

Minimum and maximum values for a parameter. For string and array parameters it is applied to the length. For number parameters it sets the range for the value. 

Take a look at [MinMax API Class](public/tests/param/MinMax.php) and tests in [minmax.feature](features/tests/param/minmax.feature)

## @fix

Syntax:

	@param string|int|float|array $name [Description] {@fix true}
	
Example:

	@param string $name 3 to 10 characters in length {@max 10}{@fix true}
	
suggests the validator to attempt fixing the validation problem. In the above example Validator will trim off the excess characters instead of throwing an exception 

Take a look at [MinMaxFix API Class](public/tests/param/MinMaxFix.php) and tests in [minmaxfix.feature](features/tests/param/minmaxfix.feature)

-----------------------

More to follow...