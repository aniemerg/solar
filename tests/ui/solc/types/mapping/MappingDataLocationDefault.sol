//@ compile-flags: -Ztypeck
contract c {
    mapping(uint => uint) y;
    function f() view public {
        mapping(uint => uint) x = y; //~ ERROR: expected data location
        x;
    }
}
