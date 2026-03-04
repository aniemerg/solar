contract test {
	event Test(uint a,); //~ ERROR: trailing `,` separator is not allowed
	function(uint a) {} //~ ERROR: expected a state variable declaration
//~^ WARN: named function type parameters are deprecated
}
