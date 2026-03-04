//@ compile-flags: -Ztypeck
library L {
    function id_ext(uint x) external returns(uint) {
        return x;
    }
}

contract C {
    using L.id_ext for uint; //~ ERROR: expected library, found function
    function f(uint x) external {
        x.id_ext();
    }
}
