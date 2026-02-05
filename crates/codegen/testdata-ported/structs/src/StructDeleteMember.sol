// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructDeleteMember {
    struct TestStruct {
        uint256 m_value;
    }

    TestStruct data1;

    constructor() {
        data1.m_value = 2;
    }

    function deleteMember() public returns (uint256 ret_value) {
        TestStruct storage x = data1;
        x.m_value = 4;
        delete x.m_value;
        ret_value = data1.m_value;
    }
}
