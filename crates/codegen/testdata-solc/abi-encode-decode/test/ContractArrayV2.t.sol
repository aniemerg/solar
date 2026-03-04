// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ContractArrayV2.sol";

contract ContractArrayV2Test is Test {
    ContractArrayV2 c;

    function setUp() public {
        c = new ContractArrayV2();
    }

    function test_ContractArrayV2_f_Basic() public view {
        // f(bytes): 0x20, 0xA0, 0x20, 3, 0x01, 0x02, 0x03 -> [0x01, 0x02, 0x03]
        bytes memory encoded = abi.encode(
            uint256(0x20),
            uint256(3),
            uint256(0x01),
            uint256(0x02),
            uint256(0x03)
        );
        ContractArrayV2[] memory result = c.f(encoded);
        assert(result.length == 3);
        assert(address(result[0]) == address(0x01));
        assert(address(result[1]) == address(0x02));
        assert(address(result[2]) == address(0x03));
    }

    function test_ContractArrayV2_f_SingleValidAddress() public view {
        // f(bytes): valid 20-byte address in a uint256 slot
        // 0x0102030405060708090a0b0c0d0e0f1011121314 (20 bytes, right-padded in a 32-byte word)
        address addr = address(0x0102030405060708090a0B0c0d0e0f1011121314);
        bytes memory encoded = abi.encode(
            uint256(0x20),
            uint256(1),
            uint256(uint160(addr))
        );
        ContractArrayV2[] memory result = c.f(encoded);
        assert(result.length == 1);
        assert(address(result[0]) == addr);
    }

    function test_ContractArrayV2_f_InvalidAddress() public {
        // address with non-zero bits in upper 12 bytes -> FAILURE
        // 0x0102030405060708090a0b0c0d0e0f101112131415 is 21 bytes, doesn't fit in address
        // We encode as a raw 32-byte value with non-zero high bits
        bytes memory encoded = abi.encodePacked(
            uint256(0x20),
            uint256(1),
            bytes32(hex"000000000000000000000102030405060708090a0b0c0d0e0f101112131415")
        );
        (bool ok,) = address(c).call(
            abi.encodeWithSignature("f(bytes)", encoded)
        );
        assert(!ok);
    }

    function test_ContractArrayV2_g() public view {
        bytes memory encoded = c.g();
        (ContractArrayV2[] memory arr) = abi.decode(encoded, (ContractArrayV2[]));
        assert(arr.length == 3);
        assert(address(arr[0]) == address(0x42));
        assert(address(arr[1]) == address(0x21));
        assert(address(arr[2]) == address(0x23));
    }
}
