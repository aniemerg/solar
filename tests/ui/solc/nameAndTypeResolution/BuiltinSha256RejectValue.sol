//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        sha256.value(); //~ ERROR: member `value` not found on type `function (bytes memory) pure returns (bytes32)`
    }
}
