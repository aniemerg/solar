//@ compile-flags: -Ztypeck
error E(uint);
contract C {
    function f() public pure returns (bytes memory) {
        return abi.encode(E(2)); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
//~^ ERROR: errors can only be used with revert statements
    }
}
