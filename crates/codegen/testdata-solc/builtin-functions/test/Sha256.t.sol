// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Sha256.sol";

contract Sha256Test {
    function test_Sha256() public {
        Sha256 c = new Sha256();
        assert(c.f(4) == 0xe38990d0c7fc009880a9c07c23842e886c6bbdc964ce6bdd5817ad357335ee6f);
        assert(c.f(5) == 0x96de8fc8c256fa1e1556d41af431cace7dca68707c78dd88c3acab8b17164c47);
        assert(c.f(-1) == 0xaf9613760f72635fbdb44a5a0a63c39f12af30f950a6ee5c971be188e89c4051);
    }
}
