// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/TransientStorageStateVariableAbstractContract.sol";

contract TransientStorageStateVariableAbstractContractTest {
    C c;

    function setUp() public {
        c = new C();
    }

    function test_TransientStorageStateVariableAbstractContract() public {
        (uint256 xv, int256 yv, uint256 wv, int256 zv) = c.f();
        assert(xv == 1);
        assert(yv == 1);
        assert(wv == 2);
        assert(zv == 2);
    }
}
