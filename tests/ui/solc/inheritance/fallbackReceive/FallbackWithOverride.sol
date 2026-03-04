//@ compile-flags: -Ztypeck
contract C {
	fallback() virtual external {}
}
contract D is C {
	fallback() override external {}
}
