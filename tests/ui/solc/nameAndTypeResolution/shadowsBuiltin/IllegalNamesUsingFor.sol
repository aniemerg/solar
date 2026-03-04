//@ compile-flags: -Ztypeck
library L {
    function f() public {
    }
}

// error
struct super {
    uint a;
}

// error
struct this {
    uint a;
}

// error
struct _ {
    uint a;
}

contract C {
    // These are not errors
    using L for super; //~ ERROR: expected item, found builtin
    using L for _;
    using L for this; //~ ERROR: expected item, found builtin
}
