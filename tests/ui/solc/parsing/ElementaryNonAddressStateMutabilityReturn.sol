contract C {
    function a() public pure returns (bool payable) {} //~ ERROR: only address types can have state mutability
    function b() public pure returns (string payable) {} //~ ERROR: only address types can have state mutability
    function c() public pure returns (int payable) {} //~ ERROR: only address types can have state mutability
    function d() public pure returns (int256 payable) {} //~ ERROR: only address types can have state mutability
    function e() public pure returns (uint payable) {} //~ ERROR: only address types can have state mutability
    function f() public pure returns (uint256 payable) {} //~ ERROR: only address types can have state mutability
    function g() public pure returns (bytes1 payable) {} //~ ERROR: only address types can have state mutability
    function h() public pure returns (bytes payable) {} //~ ERROR: only address types can have state mutability
    function i() public pure returns (bytes32 payable) {} //~ ERROR: only address types can have state mutability
    function j() public pure returns (fixed payable) {} //~ ERROR: only address types can have state mutability
    function k() public pure returns (fixed80x80 payable) {} //~ ERROR: expected identifier, found keyword `payable`
    function l() public pure returns (ufixed payable) {} //~ ERROR: only address types can have state mutability
    function m() public pure returns (ufixed80x80 payable) {} //~ ERROR: expected identifier, found keyword `payable`
}
contract C1 {
    function a() public pure returns (bool view) {} //~ ERROR: only address types can have state mutability
    function b() public pure returns (string view) {} //~ ERROR: only address types can have state mutability
    function c() public pure returns (int view) {} //~ ERROR: only address types can have state mutability
    function d() public pure returns (int256 view) {} //~ ERROR: only address types can have state mutability
    function e() public pure returns (uint view) {} //~ ERROR: only address types can have state mutability
    function f() public pure returns (uint256 view) {} //~ ERROR: only address types can have state mutability
    function g() public pure returns (bytes1 view) {} //~ ERROR: only address types can have state mutability
    function h() public pure returns (bytes view) {} //~ ERROR: only address types can have state mutability
    function i() public pure returns (bytes32 view) {} //~ ERROR: only address types can have state mutability
    function j() public pure returns (fixed view) {} //~ ERROR: only address types can have state mutability
    function k() public pure returns (fixed80x80 view) {} //~ ERROR: expected identifier, found keyword `view`
    function l() public pure returns (ufixed view) {} //~ ERROR: only address types can have state mutability
    function m() public pure returns (ufixed80x80 view) {} //~ ERROR: expected identifier, found keyword `view`
}
contract C2 {
    function a() public pure returns (bool pure) {} //~ ERROR: only address types can have state mutability
    function b() public pure returns (string pure) {} //~ ERROR: only address types can have state mutability
    function c() public pure returns (int pure) {} //~ ERROR: only address types can have state mutability
    function d() public pure returns (int256 pure) {} //~ ERROR: only address types can have state mutability
    function e() public pure returns (uint pure) {} //~ ERROR: only address types can have state mutability
    function f() public pure returns (uint256 pure) {} //~ ERROR: only address types can have state mutability
    function g() public pure returns (bytes1 pure) {} //~ ERROR: only address types can have state mutability
    function h() public pure returns (bytes pure) {} //~ ERROR: only address types can have state mutability
    function i() public pure returns (bytes32 pure) {} //~ ERROR: only address types can have state mutability
    function j() public pure returns (fixed pure) {} //~ ERROR: only address types can have state mutability
    function k() public pure returns (fixed80x80 pure) {} //~ ERROR: expected identifier, found keyword `pure`
    function l() public pure returns (ufixed pure) {} //~ ERROR: only address types can have state mutability
    function m() public pure returns (ufixed80x80 pure) {} //~ ERROR: expected identifier, found keyword `pure`
}
