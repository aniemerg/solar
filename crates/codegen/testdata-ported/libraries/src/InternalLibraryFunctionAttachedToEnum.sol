// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LEnum {
    enum E { A, B }

    function equals(E a, E b) internal pure returns (bool) {
        return a == b;
    }
}

contract InternalLibraryFunctionAttachedToEnum {
    using LEnum for LEnum.E;

    function equalsA(uint256 choice) public pure returns (bool) {
        LEnum.E x = LEnum.E.A;
        return x.equals(LEnum.E(choice));
    }
}
