// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AbiEncodeWithSelector.sol";

contract AbiEncodeWithSelectorTest {
    AbiEncodeWithSelector c;

    function setUp() public {
        c = new AbiEncodeWithSelector();
    }

    function test_AbiEncodeWithSelector_f0() public view {
        bytes memory out = c.f0();
        assert(out.length == 4);
        bytes4 sel;
        assembly {
            sel := mload(add(out, 32))
        }
        assert(sel == 0x12345678);
    }

    function test_AbiEncodeWithSelector_f1_f2() public view {
        bytes memory out1 = c.f1();
        bytes memory out2 = c.f2();
        bytes4 sel1;
        bytes4 sel2;
        assembly {
            sel1 := mload(add(out1, 32))
            sel2 := mload(add(out2, 32))
        }
        assert(sel1 == 0x12345678);
        assert(sel2 == 0x12345678);
        assert(keccak256(out1) == keccak256(out2));
    }
}
