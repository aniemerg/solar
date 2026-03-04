//@ compile-flags: -Ztypeck
library L
{
	struct Nested
	{
		Non y; //~ ERROR: unresolved symbol `Non`
	}
	function f(function(Nested memory) external) external pure {}
}
