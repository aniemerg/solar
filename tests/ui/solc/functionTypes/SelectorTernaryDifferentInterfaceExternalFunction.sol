//@ compile-flags: -Ztypeck
interface I1 {
    function f() external pure;
}

interface I2 {
    function g() external pure;
}

contract C {
    function test(bool b) public returns(bytes4) {
        (b ? I1.f : I2.g).selector; //~ ERROR: member `f` not found on type `type(contract I1)`
//~^ ERROR: member `g` not found on type `type(contract I2)`
    }
}
