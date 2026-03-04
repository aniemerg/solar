//@ compile-flags: -Ztypeck
contract C {
    function f(uint size) public {
        uint x = new uint(7); //~ ERROR: expected contract or dynamic array type
    }
}
