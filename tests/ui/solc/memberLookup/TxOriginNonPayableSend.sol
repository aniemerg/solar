//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (tx.origin).send(10); //~ ERROR: member `send` not found on type `address`
    }
}
