//@ compile-flags: -Ztypeck
library Lib {
    function foo(uint256 value) internal returns (uint256) {
        return value + 42;
    }
}

contract A {
    using Lib for uint256;
}

contract B is A {
    function bar(uint256 value) public returns (uint256) {
        return value.foo(); // Usage of Lib
//~^ ERROR: member `foo` not found on type `uint256`
    }
}
