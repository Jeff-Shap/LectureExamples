
// console.log("This is external JS");



//EXAMPLE FUNCTION
		// var b_function = function (arg) {
		// 	console.log(arg);
		// 	true;
		// };
				// b_function("hello") => hello
				// b_function(hello) => Uncaught ReferenceError: 
				// ...hello is not defined(anonymous function) 

//HOW TO BUILD FUNCTIONS
	// function addAll () {
	// 	var sum = 0;
	// 	for (var i = 0; i<arguments.length; i++) {
	// 		sum += arguments[i];
	// 		};
	// 	return sum;
	// }
						// addAll(0) => 0
						// addAll(1) =>1
						// addAll(1,2,3) => 6
						//Arguments DOES NOT result in an array, not a data 
						//structure that can be manipulated (without tricks)

	// function funcwithDefaults (a,b) {
	// 	// console.log(a,b)
	// 	console.log(arguments);
	// 	if (a == undefined) {
	// 		a = 0;
	// 	}
	// 	if (b == undefined) {
	// 		b = 0;
	// 	}
	// 	return (a + b);
	// }

	// funcwithDefaults() => undefined
	// funcwithDefaults(1) => undefined
	// funcwithDefaults(1,2) => undefined


	//add console.log(a,b) to see what is captured 
	//	(especially for nils)
	// funcwithDefaults() =>
			// undefined undefined
			// undefined
	// funcwithDefaults(1) =>
			// 1 undefined
			// undefined
	// funcwithDefaults(1,2) => 
			// 1 2
			// undefined


	//add return (a + b);
	// funcwithDefaults() => 
			//undefined undefined
			// 0
	// funcwithDefaults(1) =>
			// 1 undefined
			// 1
	// funcwithDefaults(1,2) =>
			// 1 2
			// 3
	// funcwithDefaults(1,2,3) =>
			// 1 2
			// 3


	// replace console.log(a,b) with
	// console.log(arguments)
	// funcwithDefaults() =>
			// []
			// 0
	// funcwithDefaults(1) =>
			// [1]
			// 1
	// funcwithDefaults(1,2) => 
			// [1, 2]
			// 3
	// funcwithDefaults(1,2,3) =>
			// [1, 2, 3]
			// 3

//Equality
		//SEE: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness
		//local: Documents/MyPics/CodingPics/Javascriptequality.png

//SCOPES
	//There are two scopes, global and function
	//To check for global scope, use window.(arg)
			// var a = 1 => undefined
			// a = 1 => 1
			// window.a => 1
			// var b = 2 => undefined
			// b => 2
			// window.be =>2
	//Global scope conflict example:
		//uncomment html page to activate 2.js
			// var my_own_var = "testjs"

			// 	function hello1() {
			// 		console.log(my_own_var);
			// 	}

			// 	hello1() => hellojs2
			// 	hello2() => hellojs2

	//WRAPS VARIABLE AND MAKES IT GLOBALLY AVAILABLE
	//uncomment html page to activate 2.js
		// function scope_func() {
		// 	var my_own_var = "testjs";
		// 	window.hello1 = function() {
		// 		console.log(my_own_var);
		// 	}
		// }
		// scope_func()

		// hello1() => testjs
		// hello2() => hellojs2

	//HOISTING
		// console.log(x === undefined);
		// var x = 3;
			//ALL VARIABLE DEFINITIONS ARE "HOISTED" TO THE TOP 
			//OF THE SCOPE REGARDLESS OF LOCATION IN CODE
				//TO AVOID, CUT AND PASTE ALL VARIABLE DECLARATIONS TO TOP OF SCOPE

	//TO CREATE A LOCAL "CONTAINER"
			// window.onload = function () {
			// 	var my_own_var = "private local variables";
			// 	console.dir(document.getElementById("input"));
			// }

//HASHES
	//Arrays and Object Literals are both hashes
		//thus, arrays (hashes) can be treated like objects

		//ITERATE OVER EVERY OBJECT IN AN ARRAY
		// a = [0,1,2];
		// a ["x"] = "something"

		// for (var i = 0; i < a.length; i++) {
		// 	console.log(a[i]);
		// }

		// for (var key in a) {
		// 	console.log(key + ": " + a[key]);
		// }
				// SYNTAX of above
				// for (var key in hash) {
				// 	console.log(key + ": " + hash[key]);
				// }

//"CLASSES"

		// var dog = {
		// 	name: "Fide",
		// 	bark: function () {
		// 		console.log("bark bark");
		// 	}
		// }


		// var chihuaha = dog;  //"inherits" values of dog, above
		// chihuaha.type = "chihuaha";
		// chihuaha.growl = function () {
		// 	console.log ("grrr");
		// }

				// dog.name => "Fide"
				// dog.bark() => bark bark
				// chihuaha.name => "Fide"
				// chihuaha.bark() => bark bark
				// chihuaha.type => "chihuaha"
				// chihuaha.growl() => grrr
				// dog.growl() => grrr

//Defensive Programming

		// function addTwo(num) {
		// 	if (typeof(num) === "number") {
		// 		return num + 2;
		// 	}
		// }

		// 			// addTwo("s") => undefined
		// 			// addTwo([]) => undefined
		// 			// addTwo({}) => undefined


		// function addTwoToArray(arr) {
		// 	if (arr.push) {
		// 		arr.push(2);
		// 		return arr;
		// 	} else {
		// 		return []
		// 	}
		// }

		// 			// addTwoToArray([]) => [2]
		// 			// addTwoToArray([1,2,3]) => [1, 2, 3, 2]



		// function addTwo(num) {
		// 	console.log(num + 2);
		// }

		// 		// addTwo(1) => 3
		// 		// addTwo("string") => string2
		// 		// addTwo([1,2]) => 1,22
		// 		// addTwo({}) => object Object]2

//FIZZBUZZ
			// function fizzBuzz (from, to) {
			// 	while (from<=to) {
			// 		if (from%15 === 0) {
			// 			console.log("FizzBuzz");
			// 		} else if(from%3 === 0) {
			// 			console.log("Fizz");
			// 		} else if (from%5 === 0) {
			// 			console.log("Buzz");
			// 		} else {console.log(from)};
			// 		from+=1;
			// 	}
			// }

			// function fizzBuzz2 (max) {
			// 	i = 0;
			// 	while (i<=max) {
			// 		if (i%15 === 0) {
			// 			console.log("FizzBuzz");
			// 		} else if(i%3 === 0) {
			// 			console.log("Fizz");
			// 		} else if (i%5 === 0) {
			// 			console.log("Buzz");
			// 		} else {console.log(i)};
			// 		i+=1;
			// 	}
			// }

			

//REFACTOR:
		// function evenOrOdd(num) {
		// 	if (num % 2 === 0) {
		// 		return "even";
		// 	} else {
		// 		return "odd";
		// 	}
		// }

		// function map (arr, func) {
		// 	var result = [];

		// 	console.log(func);
		// 	for (var i = 0; i < arr.length; i++) {
		// 		item = arr[i];
		// 		result.push(func(item));
		// 	}
		// 	return result;
		// }

		// console.log(map([1,2,3], evenOrOdd))


		// function map (arr){
		// 	var result = [];

		// 	console.log(func);
		// 	for (var i = 0; i < arr.length; i++) {
		// 		item = arr[i];
		// 		result.push(func(item));
		// 	}
		// 	return result;
		// }

		// console.log(function(map), function() {
		// 	if (arguments % 2 === 0) {
		// 		return "even";
		// 	} else {
		// 		return "odd";
		// 	}
		// }
		// )
		// )







