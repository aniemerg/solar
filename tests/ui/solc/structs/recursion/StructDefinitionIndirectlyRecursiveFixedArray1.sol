//@ compile-flags: -Ztypeck
contract Test {
    struct MyStructName1 { //~ ERROR: recursive struct definition
        address addr;
        uint256 count;
        MyStructName2[1] x;
    }
    struct MyStructName2 { //~ ERROR: recursive struct definition
        MyStructName1 x;
    }
}
