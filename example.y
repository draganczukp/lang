namespace Example; // Optional namespace, without it everything in this file would be global

import <stdlib> // Importing namespace
import <math.Random> // Importing specific class from namespace

class Example{ // Everything must be inside of a class, like in Java


	int n; 			// Variables that don't recieve a value immediately when declared *MUST* have a type
	arr = foo(10); 	// Automatic variable type

	main(string[] args){ // Functions by default are public. `main(string[] args)` is an entry point

		println(arr[0]); // Arrays start at 0

		println("Array = ", arr); 	// Printing to screen

		// read(n);					// Reads from stdin to variable n, checking the type
		n = read("Input number: ") 	// Prints first argument on screen, then reads from stdin

		a = -5;	// Variable with negative value
		a!;		// Inverse operator. a is now 5;			(a = a * -1)
		a!;		// a is now -5;
		a+;		// Absolute operator. a is now 5			(a < 0 ? a! : a)
		a+;		// a is still 5
		a-;		// Reverse absolute operator. a is now -5	(a < 0 ? a : a!)
		a-;		// a is still -5

		bool b = false;
		b!;		// b is now true;							(b = !b)
		b!;		// b is now false;
		b+;		// b is now true;							(b ? b : b!)
		b+;		// b is still true;
		b-;		// b is now false;							(b ? b! : b)
		b-;		// b is still false;


		n, ...in = read("Input a series of space separated numbers and press Enter: "); 	// Inputs an array by reading the whole line and spliting on white space
																						// First number goes to n, the rest go into array called in.
																						// Since it was not declared anywhere it will be created at compile time:
		// int[] in;	// type is guessed based on type of the last variable. Since typeof(n) => int, then typeof(in) => int[];
		// n, ...in = read("Input...");

		sum = [arr]+; 			// Array functions and automatic variable type, [arr]+ returns the sum of all elements in the array
		// typeof(sum) => int; 	// Equivalent code in other languages:
								// ```
								// int sum = 0;
								// for(int i = 0; i < arr.length; i++) sum += arr[i];
								// return sum;
								// ```

		arr2[n] = arr[n] + random(n);	// Creating new array based on another array (arr.map(...))
										// Equivalent in other languages:
										// int[arr.length] arr2;
										// for(int n = 0; n < arr.length; n++)
										//		arr2[n] = arr[n] + random(n);

		other = new OtherClass; // Default constructor, Error if you have any other constructor defined
		other = new OtherClass([arr]+, [arr]*, [arr]%); 	// Calls the constructor with parameters (in order):
														// (arr[0] + arr[1] + arr[2]...) // sum
														// (arr[0] * arr[1] * arr[2]...) // product
														// (arr[0] % arr[1] % arr[2]...) // modulos (left to right)

		fib[n] = [							// Dynamic array. Will generate 10 first elements with the given formula
			[0] <= 0;						// 0th element is 0 according to Wikipedia
			[1] <= 1;						// 1st element of array has a static value
			[2] <= 1;						// So does 2nd element
			[n] <= [n-1] + [n-2];			// Every other element is calculated as needed with this formula. No need to write fib[n-1] when referencing same array
		];									// At this point it will generate elements from fib[3] to fib[9]. You can force more by just writing for example `fib[50];`

		println(fib[5]); // Prints out 5

		dynArr[n] = [
			[<5] <= n*n;					// For all elements below 5 the value is n^2
			[5]  <= 5;						// For element 5 the value is 5
			[n]  <= math.Math.sqrt(n);		// In all other cases (n > 5) the value is square root of n
		];									// Since math.Math.sqrt returns a float, `typeof(dynArr) => float[]`, because float is the smallest type that can fit all  elements
											// To override it simply manulay set the type: `int[] dynArr[n] = [...];`
	}


	foo(int n) => int[]{									// Parameters are pased by value
		arr = [for (i = 0, bar) <= Random.random(100)]; 	// Generating an array, in this case: array of n random elements [0, 100);
															// math.Random is imported, so: Random.random = math.Random.random => class.property = namespace.class.property
															// implicit return of last variable;
	}

	bar(int a, int b, int c) => int{
		<= a + b + c; //Explicit return
	}

	baz(int n){ // same as baz(int n)=> void { ... }
		for (i = 0, n) // For loop from 0 to n. Optional curly bracket for single line
			println(i);
		for (i = 0, n, 4){} // For loop from 0 to n with step 4 (0, 4, 8, ..., n) with empty body;
		while(n!=0){	// While loop
			n--;

			if(n < 0)
				break;	// Break out of the loop
		}
	}

	abc(int a) => string{
		a < 10 ? "a < 10" : "a >= 10"; // Ternary operator with implicit return
	}

	xyz(int a){
		if(a==0){					// if looks prety much the same as everywhere else
			println("a = 0");
		}else if(a <= 10){
			println("a <= 10);
		}else{
			println("Wrong input");
		}
	}

	zyx(string s){
		switch(s){ 							// switch-case statement, works with strings
			case "test":
				println("s == \"test\""); 	// Escaping quotes
				break; 						// break to prevent fallthrough
			case "abcd":
			case "zxcv":					// Multiple cases
				println("Either 'abcd' or 'zxcv'")
				break;
			default:
				println("default")			// Default statement if no other case is met
		}
	}

	swap(out int a, out int b){		// out function parameters, basicaly pointers
		tmp = a;
		a = b;
		b = c;
	}

	autoSwap(out a, out b){		// Function with automatic parameter type, accepts parameters of any type (similar to typescript `function autoSwap(a: any,b: any){...}`)
		tmp = a;
		a = b;
		b = c;
	}

}

class BaseClass{
	BaseClass(int n){
		println(n);
	}
}

class OtherClass : BaseClass{ // OtherClass extends BaseClass
	int {a, b, c} = 0; // Assigning a value to multiple variables: `int a = 0, b = 0, c = 0;`

	OtherClass(){ // Default constructor, assumed to be OtherClass(){} when not defined
		this.a = 1;
		this.b = 3;
		base(123); // Calling a constructor from base class
	}

	OtherClass(int a, b, c){ 	// a, b and c are of the same type, so there is no need to write the type every time
		this.{a,b,c} = {a,b,c} 	// Multiple assignment, making sure to use this.a, this.b and this.c on the left, assuming parameters on the right
								//(could be {a,b,c} = this.{a,b,c}, but it's not relevant here)
	}

	operator+(OtherClass oc) => OtherClass{		// Operator Overloading for operations with any type
												// Available: + - * /,
												// ++(automatic if operator+(int) exists) -- (also automatic),
												// +=, *=, -=, /= %= and similar are deducted automaticaly as a = a + b;
												// % (mod) ! (inverse operator) +! (absolute value),
												// << and >>(binary shift) | (binary or) & (binary and) ^ (binary xor),
												// All automatic operators can be manualy overloaded

		OtherClass output = OtherClass(this); 	// Copying constructors are added automatically
		output.{a,b,c} += oc.{a,b,c}			//
	}

	static operator-(OtherClass a, OtherClass b) => OtherClass{
		OtherClass output(a);
		output.{a,b,c} -= b.{a,b,c};

		<= output; // Not needed in this example
	}
}
