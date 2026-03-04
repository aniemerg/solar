contract C {
	function f() public {
		log0; //~ ERROR: unresolved symbol `log0`
		log1; //~ ERROR: unresolved symbol `log1`
		log2; //~ ERROR: unresolved symbol `log2`
		log3; //~ ERROR: unresolved symbol `log3`
		log4; //~ ERROR: unresolved symbol `log4`
	}
}
