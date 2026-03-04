//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        g(keccak256(uint(2))); //~ ERROR: mismatched types
        g(sha256(uint(2))); //~ ERROR: mismatched types
        g(ripemd160(uint(2))); //~ ERROR: mismatched types
    }
    function g(bytes32) pure internal {}
}
