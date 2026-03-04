//@ compile-flags: -Ztypeck
contract test {
    function fun() public {
        uint256 x = address(0).balance; //~ ERROR: invalid explicit type conversion
    }
}
