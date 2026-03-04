//@ compile-flags: -Ztypeck
contract C {
	function() external virtual fp; //~ ERROR: `virtual` is not allowed here
	function() external override fp2; //~ ERROR: `override` is not allowed here
	function() external override virtual fp3; //~ ERROR: `override` is not allowed here
//~^ ERROR: `virtual` is not allowed here
}
