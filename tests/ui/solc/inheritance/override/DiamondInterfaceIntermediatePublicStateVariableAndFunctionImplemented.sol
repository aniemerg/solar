//@ compile-flags: -Ztypeck
interface I {
	function f() external returns (uint);
}
contract A is I
{
	uint public f;
}
abstract contract B is I
{
	function f() external virtual returns (uint) { return 2; } //~ ERROR: identifier `f` already declared
}
abstract contract C is A, B {}
