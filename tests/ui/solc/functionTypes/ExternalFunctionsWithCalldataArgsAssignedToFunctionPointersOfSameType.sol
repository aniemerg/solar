//@ compile-flags: -Ztypeck
contract C {
    function f(function (string calldata) external) external {}
    function g(string calldata) external {}

    function main() external {
        function (string calldata) external ptr = this.g; //~ ERROR: mismatched types
        abi.encodeCall(this.f, (this.g)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        this.f(this.g); //~ ERROR: mismatched types
    }
}
