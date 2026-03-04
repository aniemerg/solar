// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DelegatecallReturnValue.sol";

contract DelegatecallReturnValueTest {
    DelegatecallReturnValue c;

    function setUp() public {
        c = new DelegatecallReturnValue();
    }

    function test_get_returns_0_initially() public view {
        assert(c.get() == 0);
    }

    function test_assert0_delegated_succeeds_when_zero() public {
        (bool success, bytes memory data) = c.assert0_delegated();
        assert(success == true);
        assert(data.length == 0);
    }

    function test_get_delegated_returns_0_initially() public {
        (bool success, bytes memory data) = c.get_delegated();
        assert(success == true);
        assert(data.length == 32);
        uint256 val = abi.decode(data, (uint256));
        assert(val == 0);
    }

    function test_set_and_get() public {
        c.set(1);
        assert(c.get() == 1);
    }

    function test_assert0_delegated_fails_when_nonzero() public {
        c.set(1);
        (bool success,) = c.assert0_delegated();
        assert(success == false);
    }

    function test_get_delegated_returns_set_value() public {
        c.set(42);
        (bool success, bytes memory data) = c.get_delegated();
        assert(success == true);
        uint256 val = abi.decode(data, (uint256));
        assert(val == 42);
    }
}
