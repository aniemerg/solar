contract C {
    function f() public returns (uint, uint) {
        try this.f() {

        } catch () { //~ ERROR: expected one of `function`, `mapping`, elementary type name, or path, found `)`

        }
    }
}
