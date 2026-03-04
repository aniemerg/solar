contract C {
	function f() public {
		now; //~ ERROR: unresolved symbol `now`
	}
}
