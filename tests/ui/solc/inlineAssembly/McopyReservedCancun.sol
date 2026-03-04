//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns (uint result) {
        assembly {
            let mcopy := 1 //~ ERROR: expected identifier, found Yul EVM builtin keyword `mcopy`
            result := mcopy //~ ERROR: expected identifier, found Yul EVM builtin keyword `mcopy`
        }
    }

    function g() public pure returns (uint result) {
        assembly {
            function mcopy() -> r { //~ ERROR: expected identifier, found Yul EVM builtin keyword `mcopy`
                r := 1000
            }
            result := mcopy()
        }
    }
}
