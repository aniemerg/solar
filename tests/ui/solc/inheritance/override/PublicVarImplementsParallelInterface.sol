//@ compile-flags: -Ztypeck
interface A {
    function foo() external returns (uint);
    function goo() external returns (uint);
}
interface B {
    function foo() external returns (uint);
    function goo() external returns (uint);
}
contract X is A, B {
	uint public override(A, B) foo;
    function goo() external virtual override(A, B) returns (uint) {}
}
abstract contract T is A {
    function foo() external virtual returns (uint); //~ ERROR: identifier `foo` already declared
    function goo() external virtual returns (uint);
}
contract Y is X, T {
}
