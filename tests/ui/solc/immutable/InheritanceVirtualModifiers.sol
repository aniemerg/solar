//@ compile-flags: -Ztypeck
contract B {
    uint immutable x;

    constructor() readX {
        x = 3; //~ ERROR: cannot assign to an immutable variable
    }

    modifier readX() virtual {
        _; f(3);
    }

    function f(uint a) internal pure {}
}

contract C is B {
    modifier readX() override {
        _; f(x);
    }
}
