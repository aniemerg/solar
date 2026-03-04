//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (msg.sender).send(10); //~ ERROR: member `send` not found on type `address`
    }
}
