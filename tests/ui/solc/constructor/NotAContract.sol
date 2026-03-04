//@ compile-flags: -Ztypeck
// This used to cause an internal error because of the visitation order.
contract Test {
    struct S { uint a; }
    function f() public {
       new S(); //~ ERROR: expected contract or dynamic array type
    }
}
