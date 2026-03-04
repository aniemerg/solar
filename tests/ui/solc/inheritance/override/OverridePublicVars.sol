//@ compile-flags: -Ztypeck
abstract contract A {
	int public testvar;
}
abstract contract X is A {
	int public override testvar; //~ ERROR: identifier `testvar` already declared
}
