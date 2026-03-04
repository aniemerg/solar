// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataStructMemberOffset {
    struct A {
        uint256 a;
        uint256[] b;
    }
    struct B {
        A a;
        uint256 b;
    }
    function g(B calldata b) external pure returns(uint256) {
        return b.b;
    }
    function f() public view returns(uint256, uint256) {
        uint256[] memory arr = new uint256[](20);
        arr[0] = 31; arr[2] = 84;
        B memory b = B(A(420, arr), 11);
        return (b.b, this.g(b));
    }
}
