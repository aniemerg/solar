// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/GasAndValueBasic.sol";

contract GasAndValueBasicTest is Test {
    GasAndValueBasic c;

    function setUp() public {
        c = new GasAndValueBasic{value: 20 wei}();
    }

    function test_sendAmount_5() public {
        // sendAmount(5) passes 5 wei from contract's balance to helper
        uint256 bal = c.sendAmount(5);
        assert(bal == 5);
    }

    function test_outOfGas_reverts() public {
        // outOfGas() forwards only 2 gas to setFlag, causing OOG revert
        vm.expectRevert();
        c.outOfGas();
    }

    function test_checkState_after_outOfGas() public {
        // sendAmount(5): transfers 5 wei from contract to helper, contract has 15 wei left
        c.sendAmount(5);
        // outOfGas() fails with OOG, flag stays false
        try c.outOfGas() {} catch {}
        (bool flagAfter, uint256 myBal) = c.checkState();
        assert(flagAfter == false);
        assert(myBal == 15);
    }
}
