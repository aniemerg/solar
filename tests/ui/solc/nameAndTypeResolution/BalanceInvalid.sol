//@ compile-flags: -Ztypeck
contract test {
    function fun() public {
        address(0).balance = 7; //~ ERROR: invalid explicit type conversion
//~^ ERROR: expression has to be an lvalue
    }
}
