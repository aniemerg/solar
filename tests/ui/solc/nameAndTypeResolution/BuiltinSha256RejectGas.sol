//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        sha256.gas(); //~ ERROR: member `gas` not found on type `function (bytes memory) pure returns (bytes32)`
    }
}
