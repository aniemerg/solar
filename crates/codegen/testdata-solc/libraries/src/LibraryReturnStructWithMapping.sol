// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibStructMap {
    struct Items {
        mapping(uint256 => uint256) a;
    }

    function get() public returns (Items storage x) {
        assembly { x.slot := 123 }
    }
}

contract LibraryReturnStructWithMapping {
    function f() public returns (uint256 slot) {
        LibStructMap.Items storage ptr = LibStructMap.get();
        assembly { slot := ptr.slot }
    }
}
