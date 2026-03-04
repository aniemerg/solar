//@ compile-flags: -Ztypeck
contract test {
    struct myStruct {
        ufixed a;
        int b;
    }
    myStruct a = myStruct(3.125, 3); //~ ERROR: rational literals are not supported
}
