//@ compile-flags: -Ztypeck
library L { function l() public {} }
contract test {
    function f() public {
        L x;
        x.l(); //~ ERROR: member `l` not found on type `library L`
    }
}
