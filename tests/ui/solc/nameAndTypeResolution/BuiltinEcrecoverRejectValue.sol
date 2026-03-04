//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        ecrecover.value(); //~ ERROR: member `value` not found on type `function (bytes32,uint8,bytes32,bytes32) pure returns (address)`
    }
}
