//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (tx.origin).transfer(10); //~ ERROR: member `transfer` not found on type `address`
    }
}
