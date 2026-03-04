// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageSigned.sol";

contract StorageSignedTest {
    function test_signedStorage() public {
        StorageSigned c = new StorageSigned();
        assert(MyInt.unwrap(c.a()) == -2);
        assert(MyInt.unwrap(c.direct()) == -2);
        assert(c.indirect() == -2);
        MyInt[1] memory memDirect = c.toMemDirect();
        assert(MyInt.unwrap(memDirect[0]) == -2);
        int16[1] memory memIndirect = c.toMemIndirect();
        assert(memIndirect[0] == -2);
        assert(c.div() == -1);
        // viaasm: -2 as bytes32 = 0xfffe...
        assert(c.viaasm() == 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe);
    }
}
