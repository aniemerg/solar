// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InlineAssemblyStorageAccessInsideFunction {
    uint16 x;
    uint16 public y;
    uint256 public z;

    function f() public returns (bool) {
        uint256 off1;
        uint256 off2;
        assembly {
            function f() -> o1 {
                sstore(z.slot, 7)
                o1 := y.offset
            }
            off2 := f()
        }
        assert(off2 == 2);
        return true;
    }
}
