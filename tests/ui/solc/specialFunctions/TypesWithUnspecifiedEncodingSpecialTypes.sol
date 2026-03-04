//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        (bool a,) = address(this).call(abi.encode(address(this).delegatecall, super)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: mismatched number of components
//~^^ ERROR: mismatched types
        (a,) = address(this).delegatecall(abi.encode(block, tx, mulmod)); //~ ERROR: tuple components cannot be empty
//~^ ERROR: wrong argument count for function call: 3 arguments given but expected 0
        a;
    }
}
