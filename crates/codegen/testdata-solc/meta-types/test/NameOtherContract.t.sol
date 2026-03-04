// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NameOtherContract.sol";

contract NameOtherContractTest {
    function test_c() public {
        NameOtherContract t = new NameOtherContract();
        string memory name = t.c();
        assert(keccak256(bytes(name)) == keccak256(bytes("C")));
    }

    function test_a() public {
        NameOtherContract t = new NameOtherContract();
        string memory name = t.a();
        assert(keccak256(bytes(name)) == keccak256(bytes("A")));
    }

    function test_i() public {
        NameOtherContract t = new NameOtherContract();
        string memory name = t.i();
        assert(keccak256(bytes(name)) == keccak256(bytes("I")));
    }
}
