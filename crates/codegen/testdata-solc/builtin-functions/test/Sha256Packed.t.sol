// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Sha256Packed.sol";

contract Sha256PackedTest {
    function test_Sha256Packed() public {
        Sha256Packed c = new Sha256Packed();
        assert(
            c.f(4) ==
                0x804e0d7003cfd70fc925dc103174d9f898ebb142ecc2a286da1abd22ac2ce3ac
        );
        assert(
            c.f(5) ==
                0xe94921945f9068726c529a290a954f412bcac53184bb41224208a31edbf63cf0
        );
        assert(
            c.f(-1) ==
                0xf14def4d07cd185ddd8b10a81b2238326196a38867e6e6adbcc956dc913488c7
        );
    }
}
