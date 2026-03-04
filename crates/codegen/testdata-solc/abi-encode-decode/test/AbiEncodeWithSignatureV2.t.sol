// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeWithSignatureV2.sol";

contract AbiEncodeWithSignatureV2Test {
    AbiEncodeWithSignatureV2 c;

    function setUp() public {
        c = new AbiEncodeWithSignatureV2();
    }

    function test_AbiEncodeWithSignatureV2_f0() public view {
        bytes memory r = c.f0();
        // encodeWithSignature("f(uint256)") with no args = just 4-byte selector
        assert(r.length == 4);
        // keccak256("f(uint256)")[0:4]
        bytes4 expected = bytes4(keccak256("f(uint256)"));
        assert(r[0] == expected[0] && r[1] == expected[1] && r[2] == expected[2] && r[3] == expected[3]);
    }

    function test_AbiEncodeWithSignatureV2_f1_f1s_Consistent() public {
        // f1 and f1s use same signature string, should produce identical encoding
        assert(keccak256(c.f1()) == keccak256(c.f1s()));
    }

    function test_AbiEncodeWithSignatureV2_f2() public view {
        (bytes memory r, uint[] memory ar) = c.f2();
        // r is encoded with long string signature + uint array argument
        assert(r.length > 4);
        // ar must be properly zero-initialized (memory reuse check)
        assert(ar.length == 2);
        assert(ar[0] == 0);
        assert(ar[1] == 0);
    }

    function test_AbiEncodeWithSignatureV2_f4() public view {
        bytes memory r = c.f4();
        assert(r.length > 4);
    }
}
