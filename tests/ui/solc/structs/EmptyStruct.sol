//@ compile-flags: -Ztypeck
contract test {
	struct A {} //~ ERROR: structs must have at least one field
}
