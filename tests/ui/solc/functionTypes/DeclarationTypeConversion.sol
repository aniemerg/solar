//@ compile-flags: -Ztypeck
contract D {
	function f() external {}
	function g() external {}
}
contract C {
	function f(bool c) public pure {
		(c ? D.f : D.g); //~ ERROR: member `f` not found on type `type(contract D)`
//~^ ERROR: member `g` not found on type `type(contract D)`
	}
}
