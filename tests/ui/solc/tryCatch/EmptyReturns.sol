contract C {
    function f() public {
        try this.f() returns () { //~ ERROR: expected one of `function`, `mapping`, elementary type name, or path, found `)`

        } catch {

        }
    }
}
