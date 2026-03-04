//@ compile-flags: -Ztypeck
contract c {
	struct S {
		string s;
	}
	mapping(S => uint) data; //~ ERROR: only elementary types, user defined value types, contract types or enums are allowed as mapping keys.
}
