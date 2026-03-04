//@ compile-flags: -Ztypeck
contract C {
    function g(int x, int y) public pure returns (int) { return x - y; }
    function h(int y, int x) public pure returns (int) { return y - x; }

    function f() public pure {
        (true ? g : h)({x : 1, y : 2}); //~ ERROR: incompatible conditional types
        [g, h][1]({x : 1, y : 2}); //~ ERROR: cannot infer array element type
    }
}
