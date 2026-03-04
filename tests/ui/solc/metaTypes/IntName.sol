//@ compile-flags: -Ztypeck
contract test {
	function intName() public {
		type(int).name; //~ ERROR: member `name` not found on type `type(int256)`
	}
}
