//@ compile-flags: -Ztypeck
error E();

contract C {
    function f() public pure {
        E x; //~ ERROR: name has to refer to a valid user-defined type
    }
}
