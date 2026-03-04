// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StoreInConstructor.sol";

contract StoreInConstructorTest {
    function test_StoreInConstructor() public {
        StoreInConstructor c = new StoreInConstructor();
        // f() -> FAILURE, hex"4e487b71", 0x51  (first call: flag=false, calls storedFn which panics)
        (bool success1, bytes memory data1) = address(c).call(abi.encodeWithSignature("f()"));
        assert(!success1);
        assert(data1.length >= 36);
        bytes4 selector1;
        assembly {
            selector1 := mload(add(data1, 32))
        }
        assert(selector1 == bytes4(0x4e487b71));
        uint256 code1;
        assembly {
            code1 := mload(add(data1, 36))
        }
        assert(code1 == 0x51);

        // f() -> FAILURE, hex"4e487b71", 0x51  (second call also fails since flag was not set on revert)
        (bool success2, bytes memory data2) = address(c).call(abi.encodeWithSignature("f()"));
        assert(!success2);
        assert(data2.length >= 36);
        bytes4 selector2;
        assembly {
            selector2 := mload(add(data2, 32))
        }
        assert(selector2 == bytes4(0x4e487b71));
        uint256 code2;
        assembly {
            code2 := mload(add(data2, 36))
        }
        assert(code2 == 0x51);
    }
}
