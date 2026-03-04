//@ compile-flags: -Ztypeck
contract C {
    function external_test_function() payable external {}
    function comparison_operator_for_external_function_with_extra_slots() external returns (bool) {
        return (
            (this.external_test_function{value: 4} == this.external_test_function) && //~ ERROR: call options must be part of a call expression
            (this.external_test_function{value: 4} == this.external_test_function{value: 4}) //~ ERROR: call options must be part of a call expression
//~^ ERROR: call options must be part of a call expression
        );
    }
}
