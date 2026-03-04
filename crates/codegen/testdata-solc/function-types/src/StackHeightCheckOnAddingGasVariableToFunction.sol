// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StackHeightCheckOnAddingGasVariableToFunction {
    function g() external {}
    function h() external payable {}
    function run_checks() external view returns (bool) {
        assert(
            this.g.address == this.g.address &&
            this.g{gas: 42}.address == this.g.address &&
            this.g{gas: 42}.selector == this.g.selector
        );
        assert(
            this.h.address == this.h.address &&
            this.h{gas: 42}.address == this.h.address &&
            this.h{gas: 42}.selector == this.h.selector
        );
        assert(
            this.h{gas: 42, value: 5}.address == this.h.address &&
            this.h{gas: 42, value: 5}.selector == this.h.selector
        );
        return true;
    }
}
