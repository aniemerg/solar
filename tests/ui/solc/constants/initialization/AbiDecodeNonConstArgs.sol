//@ compile-flags: -Ztypeck
contract A {
    function encoded() private view returns (bytes memory) {
        return abi.encode(hex"aaaa"); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }

    bytes constant a = abi.decode(encoded(), (bytes)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: mismatched types
}
