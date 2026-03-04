//@ compile-flags: -Ztypeck
contract A {
    function f(uint a) external {}

    function getA() private view returns(uint) {
        return 1;
    }

    bytes constant fCallA = abi.encodeCall(A.f, (getA())); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `f` not found on type `type(contract A)`
}
