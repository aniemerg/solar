// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingStringKey {
    mapping(string => uint256) m_nameToRecord;

    function set(string calldata key, uint256 value) external {
        m_nameToRecord[key] = value;
    }

    function get(string calldata key) external view returns (uint256) {
        return m_nameToRecord[key];
    }

    function setFixed(uint256 value) external {
        m_nameToRecord["fixed"] = value;
    }

    function getFixed() external view returns (uint256) {
        return m_nameToRecord["fixed"];
    }
}
