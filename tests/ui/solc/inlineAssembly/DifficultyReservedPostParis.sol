//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (uint256 ret) {
        assembly {
            let difficulty := sload(0) //~ ERROR: expected identifier, found Yul EVM builtin keyword `difficulty`
            ret := difficulty //~ ERROR: expected identifier, found Yul EVM builtin keyword `difficulty`
        }
    }

    function g() public pure returns (uint256 ret) {
        assembly {
            function difficulty() -> r { //~ ERROR: expected identifier, found Yul EVM builtin keyword `difficulty`
                r := 1000
            }
            ret := difficulty()
        }
    }
}
