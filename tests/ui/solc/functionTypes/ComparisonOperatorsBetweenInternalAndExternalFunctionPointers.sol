//@ compile-flags: -Ztypeck
contract C {
    function external_test_function() external {}
    function internal_test_function() internal {}

    function comparison_operator_between_internal_and_external_function_pointers() external returns (bool) {
        function () external external_function_pointer_local = this.external_test_function;
        function () internal internal_function_pointer_local = internal_test_function;

        assert(
            this.external_test_function == external_function_pointer_local && //~ ERROR: cannot apply builtin operator `==` to `function () external` and `function () external`
            internal_function_pointer_local == internal_test_function //~ ERROR: cannot apply builtin operator `==` to `function ()` and `function ()`
        );
        assert(
            internal_function_pointer_local != external_function_pointer_local && //~ ERROR: cannot apply builtin operator `!=` to `function ()` and `function () external`
            internal_test_function != this.external_test_function //~ ERROR: cannot apply builtin operator `!=` to `function ()` and `function () external`
        );

        return true;
    }
}
