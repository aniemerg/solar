contract C {
    function g() public pure {
        int a;
        a ** 1E1233; //~ ERROR: rational part too large
        a ** (1/2);
    }
}
