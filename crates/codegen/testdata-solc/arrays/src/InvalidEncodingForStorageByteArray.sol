// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvalidEncodingForStorageByteArray {
    bytes public x = "abc";
    bytes public y;

    function invalidateXShort() public {
        assembly { sstore(x.slot, 64) }
        delete y;
    }
    function invalidateXLong() public {
        assembly { sstore(x.slot, 5) }
        delete y;
    }
    function abiEncode() public view returns (bytes memory) { return x; }
    function abiEncodePacked() public view returns (bytes memory) { return abi.encodePacked(x); }
    function copyToMemory() public view returns (bytes memory m) { m = x; }
    function indexAccess() public view returns (bytes1) { return x[0]; }
    function assignTo() public { x = "def"; }
    function assignToLong() public { x = "1234567890123456789012345678901234567"; }
    function copyToStorage() public { y = x; }
    function copyFromStorageShort() public { y = "abc"; x = y; }
    function copyFromStorageLong() public { y = "1234567890123456789012345678901234567"; x = y; }
    function arrayPop() public { x.pop(); }
    function arrayPush() public { x.push("t"); }
    function arrayPushEmpty() public { x.push(); }
    function del() public { delete x; }
}
