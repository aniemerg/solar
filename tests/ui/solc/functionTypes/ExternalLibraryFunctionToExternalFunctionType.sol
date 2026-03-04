//@ compile-flags: -Ztypeck
library L {
    function f(uint256 _a) external returns (uint256) {}
}

contract C {
    function run(function(uint256) external returns (uint256) _operation) internal returns (uint256) {}
    function test() public {
        run(L.f); //~ ERROR: member `f` not found on type `type(library L)`
        function(uint256) external returns (uint256) _operation = L.f; //~ ERROR: member `f` not found on type `type(library L)`
    }
}
