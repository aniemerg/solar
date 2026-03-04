//@ compile-flags: -Ztypeck
library super {
    function f() public {
    }
}

library this {
    function f() public {
    }
}
library _ {
    function f() public {
    }
}

contract C {
    // These are not errors
    using super for uint; //~ ERROR: expected library, found builtin
    using this for uint16; //~ ERROR: expected library, found builtin
    using _ for int;
}
