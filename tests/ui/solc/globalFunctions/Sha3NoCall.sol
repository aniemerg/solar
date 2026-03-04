contract C
{
	function f(bytes memory data) public pure {
		sha3; //~ ERROR: unresolved symbol `sha3`
	}
}
