// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ArrayFunctionPointers.sol";

contract ArrayFunctionPointersTest is Test {
    function test_ArrayFunctionPointers() public {
        ArrayFunctionPointers c = new ArrayFunctionPointers();
        // All calls revert or run out of gas due to huge array allocation or invalid jump
        bool ok;
        (ok,) = address(c).call{gas: 3000000}(abi.encodeCall(c.f, (1823621, 12323)));
        assertFalse(ok);

        (ok,) = address(c).call{gas: 3000000}(abi.encodeCall(c.f2, (18723921, 1823621, 123, 12323)));
        assertFalse(ok);

        (ok,) = address(c).call{gas: 3000000}(abi.encodeCall(c.g, (1823621, 12323)));
        assertFalse(ok);

        (ok,) = address(c).call{gas: 3000000}(abi.encodeCall(c.g2, (18723921, 1823621, 123, 12323)));
        assertFalse(ok);
    }
}
