//@ compile-flags: -Ztypeck
contract I {
	function f() external view virtual returns (uint) { return 1; }
}
contract A is I
{
	uint public override f;
}
contract B is I
{
	function f() external pure virtual override returns (uint) { return 2; } //~ ERROR: identifier `f` already declared
}
contract C is A, B {}
