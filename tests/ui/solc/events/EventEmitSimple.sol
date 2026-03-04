//@ compile-flags: -Ztypeck
contract C {
    event e();
    function f() public {
        emit e();
    }
}
