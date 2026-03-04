//@ compile-flags: -Ztypeck
contract A {
    uint public foo;
}
contract X is A {
	uint public override foo; //~ ERROR: identifier `foo` already declared
}
