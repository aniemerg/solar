// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/WrapUnwrapViaContractName.sol";

contract WrapUnwrapViaContractNameTest {
    function test_viaContractName() public {
        WrapUnwrapViaContractName d = new WrapUnwrapViaContractName();
        assert(d.f(C.T.wrap(0x42)) == 0x42);
        assert(C.T.unwrap(d.g(0x42)) == 0x42);
        assert(d.h(0x42) == 0x42);
        assert(C.T.unwrap(d.i(C.T.wrap(0x42))) == 0x42);
    }
}
