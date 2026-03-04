contract C {
    function f() public returns (string memory) {
        try this.f() returns (string storage a) {} catch { } //~ ERROR: invalid data location `storage`
    }
}
