//@ compile-flags: -Ztypeck
uint constant this = 1;
uint constant super = 2;
uint constant _ = 3;
contract C {
	address this; //~ ERROR: identifier `this` already declared
	int super; //~ ERROR: identifier `super` already declared
	mapping (address => address) _;
}

contract D {
	address[] this; //~ ERROR: identifier `this` already declared
	struct _ { uint super; }
}
