//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract Test {
    struct MyStructName {
        address addr;
        MyStructName[] x;
    }

    function f(MyStructName memory s) public {} //~ ERROR: recursive types cannot be parameter or return types of public functions
}
