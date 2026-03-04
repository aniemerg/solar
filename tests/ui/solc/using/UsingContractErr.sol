//@ compile-flags: -Ztypeck
contract C {
    function f(uint) external {
    }
}
interface I {
    function f(uint) external;
}

contract Test {
    using C for uint; //~ ERROR: using directive must reference a library
}
