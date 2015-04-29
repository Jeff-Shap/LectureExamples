// Javascript Notes


//Printing to the Console
		console.log("hello world") => hello world


//Introspection
		1
		1
		1.5
		1.5
		typeof 1
		"number"
		typeof 1.5
		"number"

//Math Operators
		1+1
		2
		1-1
		0
		5/2
		2.5
		1*2
		2
		10%3
		1
		1 + 2 * 2
		5
		(1 + 2) * 2
		6

//Infinitiy
		1/0
		Infinity
			//NO ERROR RAISED ABOVE
		typeof Infinity
		"number"

//String methods
		"Hello"
		typeof "Hello" => "string"
		"Hello".length => 5
		"hello" + "world" => "helloworld"
		"Hello\nWorld" => "Hello
											 World"
		"Hello\tWorld" => "Hello	World"
		"Hello\\World" => "Hello\World"
		"\a" => "a"
		'hello' => "hello"

//TYPES OF "NOTHINGNESS"
		null => null
			//null is used in java as well
		typeof null => "object"
		NaN => NaN
		typeof NaN => "number"

//Booleans
		true => true
		false => false
		typeof true => "boolean"
		true && true => true
		false || true => true
		!true => false

//Math Booleans
		1 > 0 => true
		1>= 0 => true
		1 <0 => false
		1 <= 0 => false
		!!4 => true
		!!"string" => true
		!!"" => false
		!!0 => false
		!!NaN => false

//Arrays
		[1,2,3] => [1, 2, 3]
		[1,2,3][0] => 1
		[1,2,3].length => 3
		[1, "2", null]
		[1, "2", null][3] => undefined
		[1, "2", null][2] => null

//Objects
		{a: 1, b: 2} => Uncaught SyntaxError: Unexpected token :InjectedScript._evaluateOn
		console.log({a: 1, b: 2}) => Object {a: 1, b: 2}
		console.log({a: 1, b: 2}["a"]) => 1
		//JS DOES NOT HAVE SYMBOLS, ONLY STRINGS AS NOTED ABOVE ###

//RegEx
		console.log(/\s+/) => /\s+/
		"Hello World".match(/\s+/) => [" "]
		"HelloWorld".match(/\s+/) => null

//Variables
		//Refresh will reset variable values in console
		a => Uncaught ReferenceError: a is not defined(anonymous function)
		var a = 1 => undefined
		a => 1
		a = "hello" => "hello"
		var a = "hello" => undefined
		a => "hello"
		var b = "world" => undefined
		b = 1 => 1
		b => 1
		c => Uncaught ReferenceError: c is not defined(anonymous function) 
		var c => undefined
		c => undefined

//Constant Variables
		const d = 1 => undefined
		var d = "hello" => undefined
		d => 1t
		const d = "hello" => Uncaught TypeError: Identifier 'd' has already been declared(anonymous function) 

//counters for loops
		a = 1 => 1
		a += 1 => 2
		a => 2
		a += 3 => 5
		a => 5
		a => 5
		a-- =>5
		a => 4
		a-- => 4
		a => 3









