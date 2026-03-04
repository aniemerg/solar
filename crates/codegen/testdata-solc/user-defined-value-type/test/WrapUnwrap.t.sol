// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/WrapUnwrap.sol";

contract WrapUnwrapTest {
    function test_wrapUnwrapAccessors() public {
        WrapUnwrap c = new WrapUnwrap();
        c.f();
    }
}
