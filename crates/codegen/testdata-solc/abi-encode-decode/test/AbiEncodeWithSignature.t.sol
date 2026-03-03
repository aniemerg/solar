// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeWithSignature.sol";

contract AbiEncodeWithSignatureTest {
    AbiEncodeWithSignature c;

    function setUp() public {
        c = new AbiEncodeWithSignature();
    }

    function test_AbiEncodeWithSignature_f0() public view {
        bytes memory out = c.f0();
        assert(out.length == 4);
        bytes4 sel;
        assembly {
            sel := mload(add(out, 32))
        }
        assert(sel == bytes4(keccak256("f(uint256)")));
    }

    function test_AbiEncodeWithSignature_f1_f1s() public {
        bytes memory out1 = c.f1();
        bytes memory out2 = c.f1s();
        bytes4 sel1;
        bytes4 sel2;
        assembly {
            sel1 := mload(add(out1, 32))
            sel2 := mload(add(out2, 32))
        }
        assert(sel1 == bytes4(keccak256("f(uint256)")));
        assert(sel2 == bytes4(keccak256("f(uint256)")));
        assert(keccak256(out1) == keccak256(out2));
    }
}
