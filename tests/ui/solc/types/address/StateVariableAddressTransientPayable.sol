//@ compile-flags: -Ztypeck
contract C {
    address transient payable a; //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: expected one of `;` or `=`, found `a`
}
