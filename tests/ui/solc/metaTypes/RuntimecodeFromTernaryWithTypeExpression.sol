//@ compile-flags: -Ztypeck
contract A {
    function f() public {}
}

contract B {
    function g() public {}
}

contract C {
    function ab(bool getA) pure public returns (bytes memory) {
        return (getA ? type(A) : type(B)).runtimeCode; //~ ERROR: incompatible conditional types
    }
}
