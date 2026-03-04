//@ compile-flags: -Ztypeck
contract A {
	uint i;
}
contract B is A {
	uint i; //~ ERROR: identifier `i` already declared
}
