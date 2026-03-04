//@ compile-flags: -Ztypeck
contract C {
    function f() view internal {
        msg.value;
    }
}
