// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/SaltedCreate.sol";

contract SaltedCreateTest {
    function test_SaltedCreate() public {
        SaltedCreate c = new SaltedCreate();
        // different_salt() -> true
        assert(c.different_salt() == true);
        // same_salt() -> true  (second deploy with same salt reverts)
        assert(c.same_salt() == true);
    }
}
