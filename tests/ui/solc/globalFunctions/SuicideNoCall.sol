contract C
{
	function f(bytes memory data) public pure {
		suicide; //~ ERROR: unresolved symbol `suicide`
	}
}
