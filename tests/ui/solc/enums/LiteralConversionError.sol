//@compile-flags: -Ztypeck
contract C {
    enum Test { One, Two }
    function f() public {
        Test(-1);
        Test(2);
        Test(13);
        Test(5/3);
        Test(0.5); //~ ERROR: rational literals are not supported
    }
}
