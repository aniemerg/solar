//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        bool x;
        abi.decode("", (uint[type(x = true ? uint8 : uint8).max])); //~ ERROR: expected one of `)` or `[`, found `=`
    }
}
