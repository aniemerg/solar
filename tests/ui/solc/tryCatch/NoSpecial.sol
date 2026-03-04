//@compile-flags: -Ztypeck
contract C {
    function f() public returns (uint, uint) {
        try this {
        } catch {
        }
        try gasleft() {
        } catch {
        }
        try type(address) { //~ ERROR: invalid type
        } catch {
        }
    }
}
