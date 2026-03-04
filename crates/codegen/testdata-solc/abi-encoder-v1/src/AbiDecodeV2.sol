// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiDecodeV2 {
    struct S {
        uint256 a;
        uint256[] b;
    }

    function f() public pure returns (S memory) {
        S memory s;
        s.a = 8;
        s.b = new uint256[](3);
        s.b[0] = 9;
        s.b[1] = 10;
        s.b[2] = 11;
        return abi.decode(abi.encode(s), (S));
    }
}
