//@ compile-flags: -Ztypeck
abstract contract C {
	constructor() {}
}
contract D {
	function f() public { C c = new C(); c; } //~ ERROR: cannot instantiate abstract contracts
}
