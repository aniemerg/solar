//@ compile-flags: -Ztypeck
contract C {
    function (uint) external payable returns (uint) x;
    function f() public {
        x.gas(2)(1); //~ ERROR: member `gas` not found on type `function (uint256) payable external returns (uint256)`
    }
}
