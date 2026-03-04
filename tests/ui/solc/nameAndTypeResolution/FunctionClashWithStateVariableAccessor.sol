//@ compile-flags: -Ztypeck
contract test {
    function fun() public {
        uint64(2);
    }
    uint256 foo;
    function foo() public {} //~ ERROR: identifier `foo` already declared
}
