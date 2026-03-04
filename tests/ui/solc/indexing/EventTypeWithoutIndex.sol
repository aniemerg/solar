//@ compile-flags: -Ztypeck
contract MyContract {
    event MyCustomEvent(uint256);
    function test() public {
        MyCustomEvent[]; //~ ERROR: cannot index into event MyContract.MyCustomEvent(uint256)
    }
}
