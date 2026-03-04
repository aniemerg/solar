// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicMemoryCopy {
    function check(bytes memory buf) public view returns (bool same, bool inplaceDecoded) {
        (uint256[] memory arr1, uint256[] memory arr2) = abi.decode(buf, (uint256[],uint256[]));
        assembly {
            // Check whether arr1 and arr2 end up at the same memory location.
            same := eq(arr1, arr2)
            // Check whether arr1 points to the part of buf containing the encoding of arr1.
            inplaceDecoded := eq(arr1, add(buf, 0x60))
        }
    }
}
