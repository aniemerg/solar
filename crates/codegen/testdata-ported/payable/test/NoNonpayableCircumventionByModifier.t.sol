// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NoNonpayableCircumventionByModifier.sol";

contract NoNonpayableCircumventionByModifierTest {
    function test_NoNonpayableCircumventionByModifier() public {
        NoNonpayableCircumventionByModifier c = new NoNonpayableCircumventionByModifier();
        (bool ok, ) = address(c).call{value: 27}(
            abi.encodeWithSignature("f()")
        );
        assert(ok == false);
        assert(address(c).balance == 0);
    }
}
