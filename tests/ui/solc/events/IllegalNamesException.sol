//@ compile-flags: -Ztypeck
// Exception for the illegal name list. External interface events
contract C {
	event this(); //~ ERROR: identifier `this` already declared
	event super(); //~ ERROR: identifier `super` already declared
	event _();
}
