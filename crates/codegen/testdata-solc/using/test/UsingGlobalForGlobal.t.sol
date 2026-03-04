// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/UsingGlobalForGlobal.sol";

contract UsingGlobalForGlobalTest {
    UsingGlobalForGlobal c;

    function setUp() public {
        c = new UsingGlobalForGlobal();
    }

    function test_f() public view {
        // f(uint256): 100 -> 111 (100 + 1 via fInc, + 10 via gInc)
        MyGlobal result = c.run(MyGlobal.wrap(100));
        assert(MyGlobal.unwrap(result) == 111);
    }
}
