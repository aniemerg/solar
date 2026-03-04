//@ compile-flags: -Ztypeck
library L {}
contract C {
	function f() public override (L) {} //~ ERROR: override is not a base contract
}
