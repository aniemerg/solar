//@ compile-flags: -Ztypeck
contract X {
	int public override override testvar; //~ ERROR: override already specified
	function test() internal override override returns (uint256); //~ ERROR: override already specified
}
