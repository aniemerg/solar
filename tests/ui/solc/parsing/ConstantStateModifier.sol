contract C {
	uint s;
	function f() public constant returns (uint) { //~ ERROR: expected one of `;`, `external`, `internal`, `override`, `payable`, `private`, `public`, `pure`, `returns`, `view`, `virtual`, or `{`, found keyword `constant`
		return s;
	}
}
