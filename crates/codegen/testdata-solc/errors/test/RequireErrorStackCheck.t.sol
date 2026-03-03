// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/RequireErrorStackCheck.sol";

contract RequireErrorStackCheckTest {
    RequireErrorStackCheck c;

    function setUp() public {
        c = new RequireErrorStackCheck();
    }

    function test_RequireErrorStackCheck() public {
        // f(bool,uint256,uint256,uint256): true, 42, 4242, 424242 ->
        // x() -> 4242
        c.f(true, 42, 4242, 424242);
        assert(c.x() == 4242);
    }
}
