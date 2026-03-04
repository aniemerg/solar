//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        ecrecover.gas(); //~ ERROR: member `gas` not found on type `function (bytes32,uint8,bytes32,bytes32) pure returns (address)`
    }
}
