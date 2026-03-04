// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyStorageAccessLocalVar {
    uint256[] public a;

    function f() public returns (uint256) {
        uint256[] storage x = a;
        uint256 off;
        assembly {
            sstore(x.slot, 7)
            off := x.offset
        }
        assert(off == 0);
        return a.length;
    }
}
