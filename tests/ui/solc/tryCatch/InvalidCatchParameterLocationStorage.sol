contract C {
    function f() public {
        try this.f() {} catch (string storage a) { } //~ ERROR: invalid data location `storage`
    }
}
