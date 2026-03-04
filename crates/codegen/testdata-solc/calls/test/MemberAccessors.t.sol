// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/MemberAccessors.sol";

contract MemberAccessorsTest is Test {
    MemberAccessors c;

    function setUp() public {
        c = new MemberAccessors();
    }

    function test_data() public view {
        assert(c.data() == 8);
    }

    function test_name() public view {
        assert(c.name() == "Celina");
    }

    function test_a_hash() public view {
        assert(c.a_hash() == keccak256("\x7b"));
    }

    function test_an_address() public view {
        assert(c.an_address() == address(0x1337));
    }

    function test_super_secret_data_has_no_getter() public {
        // super_secret_data is not public, so calling its selector should revert
        (bool success,) = address(c).call(abi.encodeWithSignature("super_secret_data()"));
        assert(success == false);
    }
}
