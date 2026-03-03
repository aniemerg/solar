// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventSelector.sol";

contract EventSelectorTest {
    function test_EventSelector() public {
        EventSelector c = new EventSelector();
        bytes32 e = keccak256("E()");
        bytes32 eu = keccak256("E(uint256)");
        bytes32 f = keccak256("F()");

        (bytes32 s1, bytes32 s2, bytes32 s3, bytes32 s4) = c.test1();
        assert(s1 == e);
        assert(s2 == eu);
        assert(s3 == e);
        assert(s4 == e);

        (bytes32 t1, bytes32 t2, bytes32 t3, bytes32 t4, bytes32 t5) = c.test2();
        assert(t1 == e);
        assert(t2 == eu);
        assert(t3 == e);
        assert(t4 == e);
        assert(t5 == e);

        assert(c.test3() == f);
    }
}
