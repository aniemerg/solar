// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/CopyInternalFunctionArrayToStorage.sol";

contract CopyInternalFunctionArrayToStorageTest is Test {
    function test_CopyInternalFunctionArrayToStorage() public {
        CopyInternalFunctionArrayToStorage c = new CopyInternalFunctionArrayToStorage();
        // one() -> 3
        assert(c.one() == 3);
        // two() -> FAILURE, panic(0x51) - uninitialized function pointer call
        vm.expectRevert();
        c.two();
    }
}
