//@ compile-flags: -Ztypeck
contract C {
	// Used to cause internal compiler error.
	function() returns (x) constant x = x; //~ ERROR: name has to refer to a valid user-defined type

}
