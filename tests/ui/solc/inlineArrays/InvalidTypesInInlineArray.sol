//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        uint[3] memory x = [45, 'foo', true]; //~ ERROR: cannot infer array element type
    }
}
