//@ compile-flags: -Ztypeck
contract D {
    mapping (uint => uint) a;
    function foo() public view {
        mapping (uint => int) storage c = a; //~ ERROR: mismatched types
    }
}
