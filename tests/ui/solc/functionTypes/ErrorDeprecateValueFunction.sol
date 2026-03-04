//@ compile-flags: -Ztypeck
contract C {
    function (uint) external payable returns (uint) x;
    function f() public {
        x.value(2)(1); //~ ERROR: member `value` not found on type `function (uint256) payable external returns (uint256)`
    }
}
