//@ compile-flags: -Ztypeck
contract c {
	struct S {
		uint x;
	}
	mapping(S => uint) data; //~ ERROR: only elementary types, user defined value types, contract types or enums are allowed as mapping keys.
}
