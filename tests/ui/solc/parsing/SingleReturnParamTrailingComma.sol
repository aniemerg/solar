contract test {
	function() returns (uint a,) {} //~ ERROR: trailing `,` separator is not allowed
//~^ ERROR: expected a state variable declaration
//~^^ ERROR: return parameters in function types may not be named
//~^^^ WARN: named function type parameters are deprecated
}
