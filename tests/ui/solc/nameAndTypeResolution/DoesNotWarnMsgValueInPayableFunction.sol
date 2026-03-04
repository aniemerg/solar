//@ compile-flags: -Ztypeck
contract C {
    function f() payable public {
        msg.value;
    }
}
