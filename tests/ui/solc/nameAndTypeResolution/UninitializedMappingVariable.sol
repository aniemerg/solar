//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        mapping(uint => uint) storage x; //~ ERROR: uninitialized mapping
        x;
    }
}
