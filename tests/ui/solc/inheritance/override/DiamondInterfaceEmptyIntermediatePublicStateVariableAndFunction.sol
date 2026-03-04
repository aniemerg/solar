//@ compile-flags: -Ztypeck
interface I {
}
contract A is I
{
	uint public f;
}
abstract contract B is I
{
	function f() external virtual returns (uint); //~ ERROR: identifier `f` already declared
}
abstract contract C is A, B {}
