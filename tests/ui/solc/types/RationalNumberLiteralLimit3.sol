//@ compile-flags: -Ztypeck
contract c {
    function bignum() public {
        uint a;
        a = 134562324532464.234452335168163517E1200 / 134562324532464.234452335168163517E1200; // still fine
//~^ ERROR: rational part too large
//~^^ ERROR: rational part too large
        a = 134562324532464.2344523351681635177E1200; // too large
//~^ ERROR: exponent too large
    }
}
