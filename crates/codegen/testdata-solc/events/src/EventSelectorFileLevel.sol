// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

event E();

library L {
    event E();
}

contract EventSelectorFileLevel {
    function main() external pure returns (bytes32, bytes32) {
        assert(E.selector == L.E.selector);

        return (E.selector, L.E.selector);
    }
}
