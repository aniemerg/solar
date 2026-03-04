// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventEmitFromOtherContract.sol";

contract EventEmitFromOtherContractTest {
    EventEmitFromOtherContract c;

    function setUp() public {
        c = new EventEmitFromOtherContract();
    }

    function test_deposit() public {
        // Event emitted from inner contract D; just verify the call succeeds
        bytes32 id = bytes32(uint256(0x1234));
        (bool ok,) = address(c).call{value: 18}(abi.encodeWithSignature("deposit(bytes32)", id));
        assert(ok);
    }
}
