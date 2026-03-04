//@ compile-flags: -Ztypeck
contract A {
    string name = "name"; //~ ERROR: mismatched types

    function getName() public view returns (string memory) {
        return name;
    }

    string public constant abName = string.concat("aaaa", "bbbb", name); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0

    string public constant abgetName = string.concat("aaaa", "bbbb",getName()); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
}
