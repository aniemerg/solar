//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        true ? true : 2; //~ ERROR: incompatible conditional types
    }
}
