// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/AssemblyAccess.sol";

contract AssemblyAccessTest {
    function test_AssemblyAccess() public {
        AssemblyAccess c = new AssemblyAccess();
        // f() -> (no return value, just asserts internally)
        c.f();
    }
}
