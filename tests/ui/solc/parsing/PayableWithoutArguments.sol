contract C {
	function f() public pure {
		address payable q = payable; //~ ERROR: expected `(`, found `;`
	}
}
