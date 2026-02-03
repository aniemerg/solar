// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CalldataArrayLength.sol";
import "../src/CalldataArrayAccess.sol";

contract CalldataMalformedTest {
    function test_MalformedLen2OffsetZero() public {
        CalldataArrayLength c = new CalldataArrayLength();
        bytes4 sel = CalldataArrayLength.len2.selector;
        bytes memory data = new bytes(4 + 32);
        assembly {
            mstore(add(data, 32), shl(224, sel))
            mstore(add(data, 36), 0)
        }
        (bool ok, ) = address(c).call(data);
        assert(ok == false);
    }

    function test_MalformedLen2OffsetNegative() public {
        CalldataArrayLength c = new CalldataArrayLength();
        bytes4 sel = CalldataArrayLength.len2.selector;
        bytes memory data = new bytes(4 + 32);
        assembly {
            mstore(add(data, 32), shl(224, sel))
            mstore(add(data, 36), 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0)
        }
        (bool ok, ) = address(c).call(data);
        assert(ok == false);
    }

    function test_MalformedLen2MissingLength() public {
        CalldataArrayLength c = new CalldataArrayLength();
        bytes4 sel = CalldataArrayLength.len2.selector;
        bytes memory data = new bytes(4 + 32);
        assembly {
            mstore(add(data, 32), shl(224, sel))
            mstore(add(data, 36), 0x20)
        }
        (bool ok, ) = address(c).call(data);
        assert(ok == false);
    }

    function test_MalformedArrayAccessMissingData() public {
        CalldataArrayAccess c = new CalldataArrayAccess();
        bytes4 sel = CalldataArrayAccess.get1.selector;
        bytes memory data = new bytes(4 + 32 + 32);
        assembly {
            mstore(add(data, 32), shl(224, sel))
            mstore(add(data, 36), 0x40)
            mstore(add(data, 68), 0)
        }
        (bool ok, ) = address(c).call(data);
        assert(ok == false);
    }
}
