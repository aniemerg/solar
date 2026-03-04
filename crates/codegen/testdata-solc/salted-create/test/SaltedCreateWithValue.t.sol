// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SaltedCreateWithValue.sol";

contract SaltedCreateWithValueTest {
    function test_SaltedCreateWithValue() public {
        SaltedCreateWithValue c = new SaltedCreateWithValue();
        // f(), 10 ether -> 3007, 3008, 3009
        (uint a, uint b, uint cc) = c.f{value: 10 ether}();
        assert(a == 3007);
        assert(b == 3008);
        assert(cc == 3009);
    }

    receive() external payable {}

    fallback() external payable {}
}
