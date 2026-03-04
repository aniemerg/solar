// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/FunctionTypeArrayToStorage.sol";

contract FunctionTypeArrayToStorageTest {
    function test_FunctionTypeArrayToStorage() public {
        FunctionTypeArrayToStorage c = new FunctionTypeArrayToStorage();
        // test() -> 0x20, 0x14, "[a called][b called]"
        string memory r1 = c.runTest();
        assert(keccak256(bytes(r1)) == keccak256(bytes("[a called][b called]")));
        // test2() -> 0x20, 0x14, "[b called][a called]"
        string memory r2 = c.runTest2();
        assert(keccak256(bytes(r2)) == keccak256(bytes("[b called][a called]")));
        // test3() -> 0x20, 0x14, "[b called][a called]"
        string memory r3 = c.runTest3();
        assert(keccak256(bytes(r3)) == keccak256(bytes("[b called][a called]")));
    }
}
