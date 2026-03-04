//@compile-flags: -Ztypeck
function this() {}
function super() {}
function _() {}

contract C {
	function test() public {
		this(); //~ ERROR: expected function, found `contract C`
		super(); //~ ERROR: expected function, found `contract C`
		_();
	}
}
