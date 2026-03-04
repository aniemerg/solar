//@ compile-flags: -Ztypeck
error E(uint);
contract C {
    function f() public pure returns (bytes memory) {
        return abi.decode(msg.data, (E(1))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: errors can only be used with revert statements
//~^^ ERROR: tuple components cannot be empty
    }
}
