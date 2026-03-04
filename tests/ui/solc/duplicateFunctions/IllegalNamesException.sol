// Exception for the rule about illegal names.
contract C {
	function this() public { //~ ERROR: identifier `this` already declared
	}
	function super() public { //~ ERROR: identifier `super` already declared
	}
	function _() public {
	}
}
