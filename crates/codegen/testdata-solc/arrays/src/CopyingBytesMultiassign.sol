// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopyingBytesMultiassignReceiver {
    uint public received;
    function recv(uint x) public { received += x + 1; }
    fallback() external { received = 0x80; }
}
contract CopyingBytesMultiassign {
    constructor() { rec = new CopyingBytesMultiassignReceiver(); }
    fallback() external { savedData1 = savedData2 = msg.data; }
    function forward(bool selector) public returns (bool) {
        if (selector) { address(rec).call(savedData1); delete savedData1; }
        else { address(rec).call(savedData2); delete savedData2; }
        return true;
    }
    function val() public returns (uint) { return rec.received(); }
    CopyingBytesMultiassignReceiver rec;
    bytes savedData1;
    bytes savedData2;
}
