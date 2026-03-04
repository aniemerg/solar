//@ compile-flags: -Ztypeck
function mload() pure {}
contract C {
    function g() public pure {
        assembly {
        }
    }
}
