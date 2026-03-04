// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Keccak256.sol";

contract Keccak256Test {
    function test_Keccak256() public {
        Keccak256 c = new Keccak256();
        assert(c.f(4) == 0x8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19b);
        assert(c.f(5) == 0x036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0);
        assert(c.f(-1) == 0xa9c584056064687e149968cbab758a3376d22aedc6a55823d1b3ecbee81b8fb9);
    }
}
