//@ compile-flags: -Ztypeck
contract C {
    mapping(uint => uint) m;
    function f() public {
        m[] = 3; //~ ERROR: index expression cannot be omitted
    }
}
