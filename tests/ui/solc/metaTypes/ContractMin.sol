//@ compile-flags: -Ztypeck
contract Min {
	function contractMin() public {
		type(Min).min; //~ ERROR: member `min` not found on type `type(contract Min)`
	}
}
