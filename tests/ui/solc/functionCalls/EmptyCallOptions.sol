//@ compile-flags: -Ztypeck
contract C {
    function f() external payable returns (uint) { return 1; }
    function g() public {
        this.f{}(); //~ ERROR: expected one of `(`, `.`, `;`, `?`, or `[`, found `{`
    }
}
