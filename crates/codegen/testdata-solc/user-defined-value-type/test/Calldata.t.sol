// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Calldata.sol";

contract CalldataTest {
    function test_calldataF() public {
        Calldata c = new Calldata();
        assert(c.test_f() == true);
    }

    function test_calldataG() public {
        Calldata c = new Calldata();
        assert(c.test_g() == true);
    }

    function test_addresses_oob() public {
        Calldata c = new Calldata();
        c.test_g();
        // After test_g, 5 items at [0..4], index 5 should revert
        try c.addresses(5) returns (MyAddress) {
            assert(false);
        } catch {}
    }
}
