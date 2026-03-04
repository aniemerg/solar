//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        ripemd160.gas(); //~ ERROR: member `gas` not found on type `function (bytes memory) pure returns (bytes20)`
    }
}
