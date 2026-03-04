//@compile-flags: -Ztypeck
contract test {
    function f() public pure {
        int x;
        uint y = uint(-x);
        -y; //~ ERROR: cannot apply unary operator `-` to `uint256`
    }
}
