// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeCall {
    bool x;

    function c(uint256 a, uint256[] memory b) public {
        require(a == 5);
        require(b.length == 2);
        require(b[0] == 6);
        require(b[1] == 7);
        x = true;
    }

    function f() public returns (bool) {
        uint256 a = 5;
        uint256[] memory b = new uint256[](2);
        b[0] = 6;
        b[1] = 7;
        (bool success, ) = address(this).call(
            abi.encodeWithSignature("c(uint256,uint256[])", a, b)
        );
        require(success);
        return x;
    }
}
