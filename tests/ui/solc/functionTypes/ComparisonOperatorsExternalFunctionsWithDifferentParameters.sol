//@ compile-flags: -Ztypeck
contract C {
    function external_test_function1(uint num) external {}
    function external_test_function2(bool val) external {}

    function comparison_operator_between_internal_and_external_function_pointers() external returns (bool) {
        function () external external_function_pointer_local1 = this.external_test_function1; //~ ERROR: mismatched types
        function () external external_function_pointer_local2 = this.external_test_function2; //~ ERROR: mismatched types

        assert(
            this.external_test_function1 == external_function_pointer_local1 && //~ ERROR: cannot apply builtin operator `==` to `function (uint256) external` and `function () external`
            this.external_test_function2 == external_function_pointer_local2 //~ ERROR: cannot apply builtin operator `==` to `function (bool) external` and `function () external`
        );
        assert(
            external_function_pointer_local2 != external_function_pointer_local1 && //~ ERROR: cannot apply builtin operator `!=` to `function () external` and `function () external`
            this.external_test_function2 != this.external_test_function1 //~ ERROR: cannot apply builtin operator `!=` to `function (bool) external` and `function (uint256) external`
        );

        return true;
    }
}
