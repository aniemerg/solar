//@ compile-flags: -Ztypeck
contract A{
    function f() public pure{

    }
}
contract B{
    A public a;
}
contract C{
    B public b;
}
contract D{
    C c;
    function f() public view{
        c.b.a.f(); //~ ERROR: member `a` not found on type `function () view external returns (contract B)`
    }
}
