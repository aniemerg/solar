// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ImmutableSigned.sol";

contract ImmutableSignedTest {
    function test_immutable() public {
        ImmutableSigned c = new ImmutableSigned();
        (MyInt a, MyBytes b) = c.direct();
        assert(MyInt.unwrap(a) == -2);
        assert(MyBytes.unwrap(b) == "ab");
        (bytes32 x, bytes32 y) = c.viaasm();
        assert(x == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe);
        assert(y == 0x6162000000000000000000000000000000000000000000000000000000000000);
    }
}
