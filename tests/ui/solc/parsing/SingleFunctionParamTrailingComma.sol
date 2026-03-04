contract test {
	function(uint a,) {} //~ ERROR: trailing `,` separator is not allowed
//~^ ERROR: expected a state variable declaration
//~^^ WARN: named function type parameters are deprecated
}
