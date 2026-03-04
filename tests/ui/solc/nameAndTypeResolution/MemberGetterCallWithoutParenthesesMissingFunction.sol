//@ compile-flags: -Ztypeck
contract A{

}
contract B{
    A public a;
}
contract C{
    B b;
    function f() public view{
        b.a.f(); //~ ERROR: member `f` not found on type `function () view external returns (contract A)`
    }
}
