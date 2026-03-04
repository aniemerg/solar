//@ compile-flags: -Ztypeck
contract c {
    function f() public pure {
        int a;
        a = (((((4 ** 4) ** 2) ** 4) ** 4) ** 4) ** 4;
        a = -(((4 ** 4 ** 2 ** 4 ** 4) ** 4) ** 4) ** 4;
        a = 4 ** (-(2 ** 4 ** 4 ** 4 ** 4 ** 4));
        a = 2 ** 1E1233; //~ ERROR: rational part too large
        a = -2 ** 1E1233; //~ ERROR: rational part too large
        a = 2 ** -1E1233; //~ ERROR: rational part too large
        a = -2 ** -1E1233; //~ ERROR: rational part too large
        a = 1E1233 ** 2; //~ ERROR: rational part too large
        a = -1E1233 ** 2; //~ ERROR: rational part too large
        a = 1E1233 ** -2; //~ ERROR: rational part too large
        a = -1E1233 ** -2; //~ ERROR: rational part too large
        a = 1E1233 ** 1E1233; //~ ERROR: rational part too large
//~^ ERROR: rational part too large
        a = 1E1233 ** -1E1233; //~ ERROR: rational part too large
//~^ ERROR: rational part too large
        a = -1E1233 ** 1E1233; //~ ERROR: rational part too large
//~^ ERROR: rational part too large
        a = -1E1233 ** -1E1233; //~ ERROR: rational part too large
//~^ ERROR: rational part too large
    }
}
