// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EvmExceptionsInConstructorCallFail.sol";

contract EvmExceptionsInConstructorCallFailTest {
    function test_EvmExceptionsInConstructorCallFail() public {
        B b = new B();
        b.testIt();
        assert(b.test() == 2);
    }
}
