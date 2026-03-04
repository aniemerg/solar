//@ compile-flags: -Ztypeck
// This used to work in pre-0.6.0.
library Lib {
    function min(uint, uint) public returns (uint); //~ ERROR: library functions must be implemented if declared
}
contract Test {
    function f() public {
        uint t = Lib.min(12, 7); //~ ERROR: member `min` not found on type `type(library Lib)`
    }
}
