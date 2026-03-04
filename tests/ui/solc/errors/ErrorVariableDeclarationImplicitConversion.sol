//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);

contract C {
    function f() public {
        bytes4 a = MyCustomError; //~ ERROR: mismatched types
    }
}
