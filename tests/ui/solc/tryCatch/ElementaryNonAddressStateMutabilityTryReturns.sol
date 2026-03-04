contract C {
    function a() public pure returns (bool) {
        try this.a() returns (bool payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function b() public pure returns (string) {
        try this.b() returns (string payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function c() public pure returns (int) {
        try this.c() returns (int payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function d() public pure returns (int256) {
        try this.d() returns (int256 payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function e() public pure returns (uint) {
        try this.e() returns (uint payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function f() public pure returns (uint256) {
        try this.f() returns (uint256 payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function g() public pure returns (bytes1) {
        try this.g() returns (bytes1 payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function h() public pure returns (bytes) {
        try this.h() returns (bytes payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function i() public pure returns (bytes32) {
        try this.i() returns (bytes32 payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function j() public pure returns (fixed) {
        try this.j() returns (fixed payable res) {} catch {} //~ ERROR: only address types can have state mutability
    }
    function k() public pure returns (fixed80x80) {
        try this.k() returns (fixed80x80 payable res) {} catch {} //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: expected one of `)` or `,`, found `res`

    }
    function l() public pure returns (ufixed) {
        try this.l() returns (ufixed payable res) {} catch {}
    }
    function m() public pure returns (ufixed80x80) {
        try this.m() returns (ufixed80x80 payable res) {} catch {}
    }
}
contract C1 {
    function a() public pure returns (bool) {
        try this.a() returns (bool view res) {} catch {}
    }
    function b() public pure returns (string) {
        try this.b() returns (string view res) {} catch {}
    }
    function c() public pure returns (int) {
        try this.c() returns (int view res) {} catch {}
    }
    function d() public pure returns (int256) {
        try this.d() returns (int256 view res) {} catch {}
    }
    function e() public pure returns (uint) {
        try this.e() returns (uint view res) {} catch {}
    }
    function f() public pure returns (uint256) {
        try this.f() returns (uint256 view res) {} catch {}
    }
    function g() public pure returns (bytes1) {
        try this.g() returns (bytes1 view res) {} catch {}
    }
    function h() public pure returns (bytes) {
        try this.h() returns (bytes view res) {} catch {}
    }
    function i() public pure returns (bytes32) {
        try this.i() returns (bytes32 view res) {} catch {}
    }
    function j() public pure returns (fixed) {
        try this.j() returns (fixed view res) {} catch {}
    }
    function k() public pure returns (fixed80x80) {
        try this.k() returns (fixed80x80 view res) {} catch {}
    }
    function l() public pure returns (ufixed) {
        try this.l() returns (ufixed view res) {} catch {}
    }
    function m() public pure returns (ufixed80x80) {
        try this.m() returns (ufixed80x80 view res) {} catch {}
    }
}
contract C2 {
    function a() public pure returns (bool) {
        try this.a() returns (bool pure res) {} catch {}
    }
    function b() public pure returns (string) {
        try this.b() returns (string pure res) {} catch {}
    }
    function c() public pure returns (int) {
        try this.c() returns (int pure res) {} catch {}
    }
    function d() public pure returns (int256) {
        try this.d() returns (int256 pure res) {} catch {}
    }
    function e() public pure returns (uint) {
        try this.e() returns (uint pure res) {} catch {}
    }
    function f() public pure returns (uint256) {
        try this.f() returns (uint256 pure res) {} catch {}
    }
    function g() public pure returns (bytes1) {
        try this.g() returns (bytes1 pure res) {} catch {}
    }
    function h() public pure returns (bytes) {
        try this.h() returns (bytes pure res) {} catch {}
    }
    function i() public pure returns (bytes32) {
        try this.i() returns (bytes32 pure res) {} catch {}
    }
    function j() public pure returns (fixed) {
        try this.j() returns (fixed pure res) {} catch {}
    }
    function k() public pure returns (fixed80x80) {
        try this.k() returns (fixed80x80 pure res) {} catch {}
    }
    function l() public pure returns (ufixed) {
        try this.l() returns (ufixed pure res) {} catch {}
    }
    function m() public pure returns (ufixed80x80) {
        try this.m() returns (ufixed80x80 pure res) {} catch {}
    }
}
