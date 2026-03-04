// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CopyStructToArrayStoredInMapping.sol";

contract CopyStructToArrayStoredInMappingTest {
    CopyStructToArrayStoredInMapping c;

    function setUp() public {
        c = new CopyStructToArrayStoredInMapping();
    }

    function test_from_storage_to_static_array() public {
        // from_storage_to_static_array() -> 0, 7 (S[2]: [S{0}, S{7}])
        CopyStructToArrayStoredInMapping.S[2] memory result = c.from_storage_to_static_array();
        assert(result[0].x == 0);
        assert(result[1].x == 7);
    }

    function test_from_storage_to_dynamic_array() public {
        // from_storage_to_dynamic_array() -> [S{7}]
        CopyStructToArrayStoredInMapping.S[] memory result = c.from_storage_to_dynamic_array();
        assert(result.length == 1);
        assert(result[0].x == 7);
    }

    function test_from_memory_to_static_array() public {
        // from_memory_to_static_array() -> 0, 7
        CopyStructToArrayStoredInMapping.S[2] memory result = c.from_memory_to_static_array();
        assert(result[0].x == 0);
        assert(result[1].x == 7);
    }

    function test_from_memory_to_dynamic_array() public {
        // from_memory_to_dynamic_array() -> [S{7}]
        CopyStructToArrayStoredInMapping.S[] memory result = c.from_memory_to_dynamic_array();
        assert(result.length == 1);
        assert(result[0].x == 7);
    }

    function test_from_calldata_to_static_array() public {
        // from_calldata_to_static_array((uint8)): 8 -> 0, 8
        CopyStructToArrayStoredInMapping.S memory sCalldata = CopyStructToArrayStoredInMapping.S({x: 8});
        CopyStructToArrayStoredInMapping.S[2] memory result = c.from_calldata_to_static_array(sCalldata);
        assert(result[0].x == 0);
        assert(result[1].x == 8);
    }

    function test_from_calldata_to_dynamic_array() public {
        // from_calldata_to_dynamic_array((uint8)): 8 -> [S{8}]
        CopyStructToArrayStoredInMapping.S memory sCalldata = CopyStructToArrayStoredInMapping.S({x: 8});
        CopyStructToArrayStoredInMapping.S[] memory result = c.from_calldata_to_dynamic_array(sCalldata);
        assert(result.length == 1);
        assert(result[0].x == 8);
    }
}
