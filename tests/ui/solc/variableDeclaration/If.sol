//@ compile-flags: -Ztypeck
pragma solidity >0.4.24;

contract C
{
	function f(uint x) public pure {
		if (x > 0)
			uint y; //~ ERROR: variable declarations can only be used inside blocks
	}
}
