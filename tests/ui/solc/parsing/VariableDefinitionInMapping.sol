contract test {
	function fun() { //~ ERROR: no visibility specified
		mapping(var=>bytes32) d; //~ ERROR: expected identifier, found reserved keyword `var`
	}
}
