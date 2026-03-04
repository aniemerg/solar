//@ compile-flags: -Ztypeck
contract B {
    function ext() external {}
    function pub() public {}
}

contract C is B {
    function test() public pure {
        B.ext.selector; //~ ERROR: member `ext` not found on type `type(contract B)`
        B.pub.selector; //~ ERROR: member `pub` not found on type `type(contract B)`
        this.ext.selector;
        pub.selector;
    }
}

contract D {
    function test() public pure {
        B.ext.selector; //~ ERROR: member `ext` not found on type `type(contract B)`
        B.pub.selector; //~ ERROR: member `pub` not found on type `type(contract B)`
    }
}
