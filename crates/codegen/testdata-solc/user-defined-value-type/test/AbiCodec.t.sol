// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiCodec.sol";

contract AbiCodecTest {
    function test_abiCodec() public {
        AbiCodec c = new AbiCodec();
        assert(c.g() == true);
    }
}
