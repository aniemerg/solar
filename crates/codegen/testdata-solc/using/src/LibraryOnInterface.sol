// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

using L for I;
interface I { function f() external pure returns (uint); }
library L {
    function execute(I i) internal pure returns (uint) {
        return i.f();
    }
}
contract LibraryOnInterface is I {
    function x() public view returns (uint) {
        I i = this;
        return i.execute();
    }
    function f() public pure returns (uint) { return 7; }
}
