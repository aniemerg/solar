//@ compile-flags: -Ztypeck
contract A {
	function f() external virtual {}
}
contract B {
	function f() external virtual {}
}
contract C is A, B {
	function f() external override (A, B); //~ ERROR: functions without implementation must be marked virtual
}
contract X is C {
}
