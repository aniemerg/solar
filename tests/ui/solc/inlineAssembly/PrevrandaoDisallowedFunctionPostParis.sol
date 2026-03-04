//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (uint256 ret) {
        assembly {
            let prevrandao := sload(0) //~ ERROR: expected identifier, found Yul EVM builtin keyword `prevrandao`
            ret := prevrandao //~ ERROR: expected identifier, found Yul EVM builtin keyword `prevrandao`
        }
    }

    function g() public pure returns (uint256 ret) {
        assembly {
            function prevrandao() -> r { //~ ERROR: expected identifier, found Yul EVM builtin keyword `prevrandao`
                r := 1000
            }
            ret := prevrandao()
        }
    }
}
