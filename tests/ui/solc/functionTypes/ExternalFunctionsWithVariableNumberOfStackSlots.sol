//@ compile-flags: -Ztypeck
contract C {
    function f (address) payable external returns (bool) {
        this.f{value: 42}.address; //~ ERROR: call options must be part of a call expression
    }
}
