//@ compile-flags: -Ztypeck
library L { function l() public {} }
contract test {
    function f() public {
        L.l{value: 1}(); //~ ERROR: member `l` not found on type `type(library L)`
    }
}
