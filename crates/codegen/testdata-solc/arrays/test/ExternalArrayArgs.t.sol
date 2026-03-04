// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/ExternalArrayArgs.sol";

contract ExternalArrayArgsTest is Test {
    function test_ExternalArrayArgs() public {
        ExternalArrayArgs c = new ExternalArrayArgs();
        // a=[1..8], b=[11,12,13], c=[21..25], a_index=0, b_index=1, c_index=2
        // -> av=a[0]=1, bv=b[1]=12, cv=c[2]=23
        uint256[8] memory aArr = [uint256(1), 2, 3, 4, 5, 6, 7, 8];
        uint256[] memory bArr = new uint256[](3);
        bArr[0] = 11; bArr[1] = 12; bArr[2] = 13;
        uint256[5] memory cArr = [uint256(21), 22, 23, 24, 25];

        (uint256 av, uint256 bv, uint256 cv) = c.doTest(aArr, bArr, cArr, 0, 1, 2);
        assertEq(av, 1);
        assertEq(bv, 12);
        assertEq(cv, 23);
    }
}
