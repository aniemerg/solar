//@ compile-flags: -Ztypeck
contract A {
	int public testvar;
	function foo() internal override(N, Z) returns (uint256); //~ ERROR: unresolved symbol `N`
//~^ ERROR: unresolved symbol `Z`
}
