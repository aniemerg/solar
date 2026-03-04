//@ compile-flags: -Ztypeck
contract c {
	mapping(string[] => uint) data; //~ ERROR: only elementary types, user defined value types, contract types or enums are allowed as mapping keys.
}
