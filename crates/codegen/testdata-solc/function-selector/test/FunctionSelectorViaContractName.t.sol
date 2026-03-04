// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionSelectorViaContractName.sol";

contract FunctionSelectorViaContractNameTest {
    function test_test1() external {
        FunctionSelectorViaContractName c = new FunctionSelectorViaContractName();
        (bytes4 s1, bytes4 s2, bytes4 s3, bytes4 s4) = c.test1();
        assert(s1 == bytes4(keccak256("f()")));
        assert(s2 == bytes4(keccak256("g(uint256)")));
        assert(s3 == bytes4(keccak256("f()")));
        assert(s4 == bytes4(keccak256("g(uint256)")));
    }

    function test_test2() external {
        FunctionSelectorViaContractName c = new FunctionSelectorViaContractName();
        (bytes4 s1, bytes4 s2, bytes4 s3, bytes4 s4) = c.test2();
        assert(s1 == bytes4(keccak256("f()")));
        assert(s2 == bytes4(keccak256("g(uint256)")));
        assert(s3 == bytes4(keccak256("f()")));
        assert(s4 == bytes4(keccak256("g(uint256)")));
    }
}
