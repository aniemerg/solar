//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        address(this).send(10); //~ ERROR: member `send` not found on type `address`
    }
}
