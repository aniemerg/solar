// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataBytesArrayBounds.sol";

contract CalldataBytesArrayBoundsTest {
    function test_CalldataBytesArrayBounds() public {
        CalldataBytesArrayBounds c = new CalldataBytesArrayBounds();
        bytes[] memory arr = new bytes[](1);
        arr[0] = hex"6162"; // "ab"
        assert(c.f(arr, 0) == 0x61);
        assert(c.f(arr, 1) == 0x62);
        (bool ok, ) = address(c).call(abi.encodeWithSelector(CalldataBytesArrayBounds.f.selector, arr, 2));
        assert(ok == false);
    }
}
