//@ compile-flags: -Ztypeck
// Previously, the type information for A was not yet available at the point of
// "new A".
contract B {
	A a;
	constructor() {
		a = new A(address(this)); //~ ERROR: cannot instantiate abstract contracts
	}
}
abstract contract A {
	constructor(address) {}
}
