// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "../src/EtherNonPayableFunction.sol";

contract EtherNonPayableFunctionTest is Test {
    EtherNonPayableFunction c;

    function setUp() public {
        c = new EtherNonPayableFunction();
        vm.deal(address(this), 1 ether);
    }

    function test_EtherNonPayableFunction() public {
        (bool ok,) = address(c).call{value: 1 ether}(abi.encodeWithSignature("f()"));
        assert(!ok);

        (bool ok2,) = address(c).call("");
        assert(!ok2);
    }
}
