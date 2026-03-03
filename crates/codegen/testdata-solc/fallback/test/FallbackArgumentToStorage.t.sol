// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FallbackArgumentToStorage.sol";

contract FallbackArgumentToStorageTest {
    function test_FallbackArgumentToStorage() public {
        FallbackArgumentToStorage c = new FallbackArgumentToStorage();

        // f() calls address(this).call("abc") which hits the fallback
        // fallback stores "abc" in x and returns ""
        (bool success, bytes memory retval) = c.f();
        assert(success);
        assert(retval.length == 0);

        // x() should return "abc"
        bytes memory xval = c.x();
        assert(xval.length == 3);
        assert(keccak256(xval) == keccak256(bytes("abc")));
    }
}
