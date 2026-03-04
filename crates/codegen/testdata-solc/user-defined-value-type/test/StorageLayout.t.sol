// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StorageLayout.sol";

contract StorageLayoutTest {
    function test_storageLayout() public {
        StorageLayout c = new StorageLayout();
        (uint slotA, uint offA) = c.storage_a();
        assert(slotA == 0 && offA == 0);
        (uint slotB, uint offB) = c.storage_b();
        assert(slotB == 0 && offB == 1);
        (uint slotC, uint offC) = c.storage_c();
        assert(slotC == 0 && offC == 2);
        (uint slotD, uint offD) = c.storage_d();
        assert(slotD == 0 && offD == 3); // address packs at offset 3 (after 3 int8s)
        (uint slotE, uint offE) = c.storage_e();
        assert(slotE == 1 && offE == 0);
        (uint slotF, uint offF) = c.storage_f();
        assert(slotF == 2 && offF == 0);
        (uint slotG, uint offG) = c.storage_g();
        assert(slotG == 2 && offG == 0x14); // after address (20 bytes)
    }
}
