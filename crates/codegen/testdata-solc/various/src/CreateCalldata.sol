// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateCalldataHelper {
    bytes public s;

    constructor(uint256 x) {
        // In legacy format, msg.data is empty during construction
        s = msg.data;
        assert(msg.data.length == 0);
    }
}

contract CreateCalldata {
    function deploy(uint256 x) public returns (address) {
        return address(new CreateCalldataHelper(x));
    }
}
