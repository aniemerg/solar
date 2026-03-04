//@ compile-flags: -Ztypeck
interface Banana {
    function transfer(address,uint256) external returns(bool);
}

contract Apple {
    function f() public pure {
        Banana.transfer; //~ ERROR: member `transfer` not found on type `type(contract Banana)`
    }
}
