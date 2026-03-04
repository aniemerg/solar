//@ compile-flags: -Ztypeck
contract c {
    function bignum() public {
        uint256 a;
        a = 1e1233 / 1e1233; // 1e1233 is still fine
//~^ ERROR: rational part too large
//~^^ ERROR: rational part too large
        a = 1e1234; // 1e1234 is too big
//~^ ERROR: exponent too large
    }
}
