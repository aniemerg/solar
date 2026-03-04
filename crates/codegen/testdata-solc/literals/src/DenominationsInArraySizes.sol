// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DenominationsInArraySizes {
    uint[2 wei] a;
    uint[2 gwei] b;
    uint[2 ether] c;
    uint[2 seconds] d;
    uint[2 minutes] e;
    uint[2 hours] f;
    uint[2 days] g;
    uint[2 weeks] h;

    function lengths() public returns (uint, uint, uint, uint, uint, uint, uint, uint) {
        return (
            a.length,
            b.length,
            c.length,
            d.length,
            e.length,
            f.length,
            g.length,
            h.length
        );
    }
}
