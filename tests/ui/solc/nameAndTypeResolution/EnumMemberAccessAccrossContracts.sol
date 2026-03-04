//@ compile-flags: -Ztypeck
contract Interface {
    enum MyEnum { One, Two }
}
contract Impl {
    function test() public returns (Interface.MyEnum) {
        return Interface.MyEnum.One; //~ ERROR: member `MyEnum` not found on type `type(contract Interface)`
    }
}
