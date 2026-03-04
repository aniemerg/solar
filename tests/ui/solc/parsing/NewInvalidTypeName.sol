contract C {
	function f() { //~ ERROR: no visibility specified
		new var; //~ ERROR: expected identifier, found reserved keyword `var`
	}
}
