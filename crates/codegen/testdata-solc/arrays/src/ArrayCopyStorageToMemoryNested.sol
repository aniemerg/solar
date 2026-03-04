// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

contract ArrayCopyStorageToMemoryNested {
    uint[][] a;

    function f() public returns (uint[][] memory) {
        a.push();
        a.push();
        a[0].push(0);
        a[0].push(1);
        a[1].push(2);
        a[1].push(3);
        uint[][] memory m = a;
        return m;
    }
}
