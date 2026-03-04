// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanupFunction {
    struct S { function() external f; }
    function ggg(function() external x) external pure returns (uint256 r) {
        assembly { r := calldataload(4) }
    }
    function h(S calldata x) external pure returns (uint256 r) {
        x.f; // validation only happens here
        assembly { r := calldataload(4) }
    }
    function dummy() external {}
    function ffff(uint256 a) external view returns (uint256, uint256) {
        S memory s = S(this.dummy);
        assembly { mstore(s, a) }
        return (this.ggg(s.f), this.h(s));
    }
}
