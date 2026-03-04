//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        address(this).transfer(10); //~ ERROR: member `transfer` not found on type `address`
    }
}
