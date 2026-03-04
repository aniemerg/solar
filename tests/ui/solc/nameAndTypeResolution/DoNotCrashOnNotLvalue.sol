//@ compile-flags: -Ztypeck
// This checks for a bug that caused a crash because of continued analysis.
contract C {
    mapping (uint => uint) m;
    function f() public {
        m(1) = 2; //~ ERROR: expected function, found `mapping(uint256 => uint256)`
//~^ ERROR: expression has to be an lvalue
    }
}
