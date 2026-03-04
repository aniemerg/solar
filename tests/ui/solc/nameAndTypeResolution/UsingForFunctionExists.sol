//@ compile-flags: -Ztypeck
library D { function double(uint self) public returns (uint) { return 2*self; } }
contract C {
    using D for uint;
    function f(uint a) public {
        a.double; //~ ERROR: member `double` not found on type `uint256`
    }
}
