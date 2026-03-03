// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructAssignReferenceToStruct {
    struct TestStruct {
        uint256 m_value;
    }
    TestStruct data1;
    TestStruct data2;
    TestStruct data3;

    constructor() {
        data1.m_value = 2;
    }

    function assign() public returns (uint256 ret_local, uint256 ret_global, uint256 ret_global3, uint256 ret_global1) {
        TestStruct storage x = data1;
        data2 = data1;

        ret_local = x.m_value;
        ret_global = data2.m_value;

        x.m_value = 3;
        data3 = x;
        ret_global3 = data3.m_value;
        ret_global1 = data1.m_value;
    }
}
