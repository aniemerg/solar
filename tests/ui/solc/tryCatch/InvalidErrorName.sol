contract C {
    function f() public returns (uint, uint) {
        try this.f() {
        } catch Error2() { //~ ERROR: expected one of `function`, `mapping`, elementary type name, or path, found `)`
        } catch abc() {
        }
    }
}
