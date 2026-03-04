//@ compile-flags: -Ztypeck
interface MyInterface {
    error MyCustomError(uint256, bool);
}

contract MyContract {
    function test() public {
        MyInterface.MyCustomError[]; //~ ERROR: member `MyCustomError` not found on type `type(contract MyInterface)`
    }
}
