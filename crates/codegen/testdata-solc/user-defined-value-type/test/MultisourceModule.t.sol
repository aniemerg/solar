// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MultisourceModule.sol";

contract MultisourceModuleTest {
    function test_wrapUnwrap() public {
        MultisourceModule c = new MultisourceModule();
        assert(MyInt.unwrap(c.f(5)) == 5);
        assert(c.g(MyInt.wrap(1)) == 1);
    }
}
