contract C {
    function f() public {
        try this.f() {
        } catch Panic() { //~ ERROR: expected one of `function`, `mapping`, elementary type name, or path, found `)`
        }
    }
}
