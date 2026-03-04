//@ compile-flags: -Ztypeck
pragma abicoder               v2;

contract C {
    function f(Data.S memory a) public {} //~ ERROR: recursive types cannot be parameter or return types of public functions
}
contract Data {
    struct S { S[] x; }
}
