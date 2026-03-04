//@ compile-flags: -Ztypeck
contract A {
	uint private i;
}
contract B is A {
	uint i;
}
