//@ compile-flags: -Ztypeck
type MyAddress is address;
interface I {}
contract C {
    function f(MyAddress a) external { //~ ERROR: function overload clash during conversion to external types for arguments
    }
    function f(address a) external {
    }
}
contract D {
    function g(MyAddress a) external {
    }
}
contract E is D {
    function g(I a) external { //~ ERROR: function overload clash during conversion to external types for arguments
    }
}
