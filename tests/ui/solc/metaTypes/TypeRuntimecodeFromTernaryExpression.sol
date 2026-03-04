//@ compile-flags: -Ztypeck
contract A {
}

contract B {
}

contract C {
    function f(bool getA) public returns (bytes memory) {
        return (getA ? type(A) : type(B)).runtimeCode; //~ ERROR: incompatible conditional types
    }
}
