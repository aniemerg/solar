contract C {
    function f() public pure returns (uint) {
        uint _;
        return _;
    }

    function g() public pure returns (uint) {
        uint _ = 1;
        return _;
    }

    function h() public pure {
        _; //~ ERROR: placeholder statements can only be used in modifiers
    }
}
