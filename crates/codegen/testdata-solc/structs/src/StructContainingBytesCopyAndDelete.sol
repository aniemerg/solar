// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructContainingBytesCopyAndDelete {
    struct Struct {
        uint a;
        bytes data;
        uint b;
    }
    Struct data1;
    Struct data2;

    function set(uint _a, bytes calldata _data, uint _b) external returns (bool) {
        data1.a = _a;
        data1.b = _b;
        data1.data = _data;
        return true;
    }

    function copy() public returns (bool) {
        data1 = data2;
        return true;
    }

    function del() public returns (bool) {
        delete data1;
        return true;
    }

    function getDataByte(uint256 i) public view returns (bytes1) {
        return data1.data[i];
    }
}
