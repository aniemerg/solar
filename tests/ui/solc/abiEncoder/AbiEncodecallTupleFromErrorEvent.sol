//@ compile-flags: -Ztypeck
contract C {
    event Ev();
    error Er();

    function f0() public {}

    function h() public view {
        abi.encodeCall(this.f0, Ev()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: event invocations have to be prefixed by "emit"
        abi.encodeCall(this.f0, Er()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: errors can only be used with revert statements
        abi.encodeCall(this.f0, revert()); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: no matching declarations found
    }
}
