// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/IndexedLogTopicDuringExplicitDowncastDuringEmissions.sol";

contract IndexedLogTopicDuringExplicitDowncastDuringEmissionsTest is Test {
    function test_IndexedLogTopicDuringExplicitDowncastDuringEmissions() public {
        // Constructor emits ev0 with bytes1(0x31)
        vm.expectEmit(true, false, false, false);
        emit IndexedLogTopicDuringExplicitDowncastDuringEmissions.ev0(0x31);
        IndexedLogTopicDuringExplicitDowncastDuringEmissions c =
            new IndexedLogTopicDuringExplicitDowncastDuringEmissions();

        // j() also emits ev0 with bytes1(0x31) despite dirty bits in assembly
        vm.expectEmit(true, false, false, false);
        emit IndexedLogTopicDuringExplicitDowncastDuringEmissions.ev0(0x31);
        c.j();
    }
}
