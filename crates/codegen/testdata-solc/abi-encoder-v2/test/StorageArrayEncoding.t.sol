// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/StorageArrayEncoding.sol";

contract StorageArrayEncodingTest is Test {
    StorageArrayEncoding c;

    function setUp() public {
        c = new StorageArrayEncoding();
    }

    function test_h() public {
        // h(uint256[2][]): 0x20, 3, 123, 124, 223, 224, 323, 324 -> 32, 256, 0x20, 3, 123, 124, 223, 224, 323, 324
        uint256[2][] memory s = new uint256[2][](3);
        s[0] = [uint256(123), 124];
        s[1] = [uint256(223), 224];
        s[2] = [uint256(323), 324];
        bytes memory result = c.h(s);
        uint256[2][] memory decoded = abi.decode(result, (uint256[2][]));
        assertEq(decoded.length, 3);
        assertEq(decoded[0][0], 123);
        assertEq(decoded[0][1], 124);
        assertEq(decoded[2][0], 323);
        assertEq(decoded[2][1], 324);
    }

    function test_i() public {
        // i(uint256[2][2]): 123, 124, 223, 224 -> 32, 128, 123, 124, 223, 224
        uint256[2][2] memory s;
        s[0] = [uint256(123), 124];
        s[1] = [uint256(223), 224];
        bytes memory result = c.i(s);
        uint256[2][2] memory decoded = abi.decode(result, (uint256[2][2]));
        assertEq(decoded[0][0], 123);
        assertEq(decoded[0][1], 124);
        assertEq(decoded[1][0], 223);
        assertEq(decoded[1][1], 224);
    }
}
