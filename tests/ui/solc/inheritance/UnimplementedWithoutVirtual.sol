//@ compile-flags: -Ztypeck
abstract contract C {
	function f() external; //~ ERROR: functions without implementation must be marked virtual
}
