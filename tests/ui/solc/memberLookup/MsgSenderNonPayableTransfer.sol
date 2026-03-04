//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (msg.sender).transfer(10); //~ ERROR: member `transfer` not found on type `address`
    }
}
