// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressCodeComplexA {
    constructor() {
        assembly {
            // This is only 7 bytes here.
            mstore(0, 0x48aa5566000000)
            return(0, 32)
        }
    }
}

contract AddressCodeComplex {
    function f() public returns (bytes memory) {
        return address(new AddressCodeComplexA()).code;
    }

    function g() public returns (uint256) {
        return address(new AddressCodeComplexA()).code.length;
    }
}
