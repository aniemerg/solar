// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inlined from s1.sol
error E(uint);

// Inlined from s2.sol (E imported as Panic)
// In s2.sol: import { E as Panic } from "s1.sol";
// So Panic is an alias for E(uint)

contract PanicViaImport {
    // a() reverts with Panic(1) which is E(1)
    function a() public pure {
        revert E(1);
    }

    // b() reverts with E(1) - same error, same selector
    function b() public pure {
        revert E(1);
    }
}
