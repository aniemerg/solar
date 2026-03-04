//@ compile-flags: -Ztypeck
library L {
    function foo(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}
contract C {
    using L for uint256;

    function bar() public {
        uint256 x;
        function (uint256, uint256) internal pure returns (uint256) ptr = x.foo; //~ ERROR: member `foo` not found on type `uint256`
    }
}
