//@ compile-flags: -Ztypeck
contract C {
    function f(uint) external {}

    function main() external view {
        function () h;
        abi.encodeCall(this.f, (h)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
