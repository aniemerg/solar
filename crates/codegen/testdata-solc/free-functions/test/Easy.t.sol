// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Easy.sol";

contract EasyTest {
    function test_Easy() public {
        Easy c = new Easy();
        assert(c.f(7) == 9);
    }
}
