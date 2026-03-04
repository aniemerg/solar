//@ compile-flags: -Ztypeck
contract A{
    function f() public pure{

    }
}
contract B{
    A private a;
}
contract C{
    B b;
    function f() public view{
        b.a.f(); //~ ERROR: member `a` not found on type `contract B`
    }
}
