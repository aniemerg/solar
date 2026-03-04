//@ compile-flags: -Ztypeck
contract c {
	mapping(uint[] => uint) data; //~ ERROR: only elementary types, user defined value types, contract types or enums are allowed as mapping keys.
}
