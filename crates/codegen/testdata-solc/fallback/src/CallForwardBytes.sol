// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Receiver {
    uint256 public received;
    function recv(uint256 x) public { received += x + 1; }
    fallback() external { received = 0x80; }
}
contract CallForwardBytes {
    Receiver rec;
    bytes savedData;

    constructor() { rec = new Receiver(); }
    fallback() external { savedData = msg.data; }
    function forward() public returns (bool) { address(rec).call(savedData); return true; }
    function clear() public returns (bool) { delete savedData; return true; }
    function val() public returns (uint) { return rec.received(); }
}
