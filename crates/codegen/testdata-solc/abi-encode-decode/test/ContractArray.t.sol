// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/ContractArray.sol";

contract ContractArrayTest is Test {
    ContractArray c;

    function setUp() public {
        c = new ContractArray();
    }

    function test_ContractArray_f() public view {
        // f(bytes): 0x20, 0xA0, 0x20, 3, 0x01, 0x02, 0x03 -> 0x20, 3, 0x01, 0x02, 0x03
        bytes memory encoded = abi.encode(
            uint256(0x20),
            uint256(3),
            uint256(0x01),
            uint256(0x02),
            uint256(0x03)
        );
        ContractArray[] memory result = c.f(encoded);
        assert(result.length == 3);
        assert(address(result[0]) == address(0x01));
        assert(address(result[1]) == address(0x02));
        assert(address(result[2]) == address(0x03));
    }

    function test_ContractArray_g() public view {
        bytes memory encoded = c.g();
        // Decode: offset + length + [0x42, 0x21, 0x23]
        (ContractArray[] memory arr) = abi.decode(encoded, (ContractArray[]));
        assert(arr.length == 3);
        assert(address(arr[0]) == address(0x42));
        assert(address(arr[1]) == address(0x21));
        assert(address(arr[2]) == address(0x23));
    }
}
