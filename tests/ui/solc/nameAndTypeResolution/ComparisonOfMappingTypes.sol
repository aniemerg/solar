//@ compile-flags: -Ztypeck
contract C {
    mapping(uint => uint) x;
    function f() public returns (bool ret) {
        mapping(uint => uint) storage y = x;
        return x == y; //~ ERROR: cannot apply builtin operator `==` to `mapping(uint256 => uint256)` and `mapping(uint256 => uint256)`
    }
}
