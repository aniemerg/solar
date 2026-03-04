//@ compile-flags: -Ztypeck
contract Test {
    function creation() public pure returns (bytes memory) {
        type(1, 2); //~ ERROR: expected one of `function`, `mapping`, elementary type name, or path, found `<integer>`
    }
}
