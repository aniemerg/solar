contract C {
    function a(bool payable) public pure {} //~ ERROR: only address types can have state mutability
    function b(string payable) public pure {} //~ ERROR: only address types can have state mutability
    function c(int payable) public pure {} //~ ERROR: only address types can have state mutability
    function d(int256 payable) public pure {} //~ ERROR: only address types can have state mutability
    function e(uint payable) public pure {} //~ ERROR: only address types can have state mutability
    function f(uint256 payable) public pure {} //~ ERROR: only address types can have state mutability
    function g(bytes1 payable) public pure {} //~ ERROR: only address types can have state mutability
    function h(bytes payable) public pure {} //~ ERROR: only address types can have state mutability
    function i(bytes32 payable) public pure {} //~ ERROR: only address types can have state mutability
    function j(fixed payable) public pure {} //~ ERROR: only address types can have state mutability
    function k(fixed80x80 payable) public pure {} //~ ERROR: expected identifier, found keyword `payable`
    function l(ufixed payable) public pure {} //~ ERROR: only address types can have state mutability
    function m(ufixed80x80 payable) public pure {} //~ ERROR: expected identifier, found keyword `payable`
}
contract C1 {
    function a(bool view) public pure {} //~ ERROR: only address types can have state mutability
    function b(string view) public pure {} //~ ERROR: only address types can have state mutability
    function c(int view) public pure {} //~ ERROR: only address types can have state mutability
    function d(int256 view) public pure {} //~ ERROR: only address types can have state mutability
    function e(uint view) public pure {} //~ ERROR: only address types can have state mutability
    function f(uint256 view) public pure {} //~ ERROR: only address types can have state mutability
    function g(bytes1 view) public pure {} //~ ERROR: only address types can have state mutability
    function h(bytes view) public pure {} //~ ERROR: only address types can have state mutability
    function i(bytes32 view) public pure {} //~ ERROR: only address types can have state mutability
    function j(fixed view) public pure {} //~ ERROR: only address types can have state mutability
    function k(fixed80x80 view) public pure {} //~ ERROR: expected identifier, found keyword `view`
    function l(ufixed view) public pure {} //~ ERROR: only address types can have state mutability
    function m(ufixed80x80 view) public pure {} //~ ERROR: expected identifier, found keyword `view`
}
contract C2 {
    function a(bool pure) public pure {} //~ ERROR: only address types can have state mutability
    function b(string pure) public pure {} //~ ERROR: only address types can have state mutability
    function c(int pure) public pure {} //~ ERROR: only address types can have state mutability
    function d(int256 pure) public pure {} //~ ERROR: only address types can have state mutability
    function e(uint pure) public pure {} //~ ERROR: only address types can have state mutability
    function f(uint256 pure) public pure {} //~ ERROR: only address types can have state mutability
    function g(bytes1 pure) public pure {} //~ ERROR: only address types can have state mutability
    function h(bytes pure) public pure {} //~ ERROR: only address types can have state mutability
    function i(bytes32 pure) public pure {} //~ ERROR: only address types can have state mutability
    function j(fixed pure) public pure {} //~ ERROR: only address types can have state mutability
    function k(fixed80x80 pure) public pure {} //~ ERROR: expected identifier, found keyword `pure`
    function l(ufixed pure) public pure {} //~ ERROR: only address types can have state mutability
    function m(ufixed80x80 pure) public pure {} //~ ERROR: expected identifier, found keyword `pure`
}
