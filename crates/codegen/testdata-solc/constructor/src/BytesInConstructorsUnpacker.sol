// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesInConstructorsUnpacker {
    uint public m_x;
    bytes public m_s;

    constructor(uint x, bytes memory s) {
        m_x = x;
        m_s = s;
    }
}
