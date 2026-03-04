contract C {
    function f() public {
        try this.f() {} catch (string calldata a) { } //~ ERROR: invalid data location `calldata`
    }
}
