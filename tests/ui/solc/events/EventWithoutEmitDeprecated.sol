//@ compile-flags: -Ztypeck
contract C {
    event e();
    function f() public {
        e(); //~ ERROR: event invocations have to be prefixed by "emit"
    }
}
