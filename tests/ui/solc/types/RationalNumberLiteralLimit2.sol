//@ compile-flags: -Ztypeck
contract c {
    function bignum() public {
        uint a;
        a = 134562324532464234452335168163516E1200 / 134562324532464234452335168163516E1200; // still fine
//~^ ERROR: rational part too large
//~^^ ERROR: rational part too large
        a = 1345623245324642344523351681635168E1200; // too large
//~^ ERROR: exponent too large
    }
}
