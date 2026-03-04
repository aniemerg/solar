contract test {
	modifier modTest(uint a,) { _; } //~ ERROR: trailing `,` separator is not allowed
	function(uint a) {} //~ ERROR: expected a state variable declaration
//~^ WARN: named function type parameters are deprecated
}
