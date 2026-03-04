//@ compile-flags: -Ztypeck
contract Test {
    struct MyStructName1 { //~ ERROR: recursive struct definition
        address addr;
        uint256 count;
        MyStructName4[1] x;
    }
    struct MyStructName2 { //~ ERROR: recursive struct definition
        MyStructName1 x;
    }
    struct MyStructName3 { //~ ERROR: recursive struct definition
        MyStructName2[1] x;
    }
    struct MyStructName4 { //~ ERROR: recursive struct definition
        MyStructName3 x;
    }
}
