//@ compile-flags: -Ztypeck
// Used to segfault.
contract C {
	struct S {
		mapping(S => uint) a;
	}
	function g (S calldata) external view {} //~ ERROR: recursive types cannot be parameter or return types of public functions
 }
