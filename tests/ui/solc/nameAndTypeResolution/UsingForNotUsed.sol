//@ compile-flags: -Ztypeck
library D { function double(uint self) public returns (uint) { return 2; } }
contract C {
    using D for uint;
    function f(uint16 a) public returns (uint) {
        // This is an error because the function is only attached to uint.
        // Had it been attached to *, it would have worked.
        return a.double(); //~ ERROR: member `double` not found on type `uint16`
    }
}
