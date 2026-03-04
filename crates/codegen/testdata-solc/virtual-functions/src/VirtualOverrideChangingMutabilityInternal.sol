// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() internal virtual {
        mutableWithViewOverride();
        mutableWithPureOverride();
        viewWithPureOverride();
    }

    function mutableWithViewOverride() internal virtual {}

    function mutableWithPureOverride() internal virtual {}

    function viewWithPureOverride() internal view virtual {}
}

contract VirtualOverrideChangingMutabilityInternal is A {
    function run() public {
        f();
    }

    function mutableWithViewOverride() internal view override {}

    function mutableWithPureOverride() internal pure override {}

    function viewWithPureOverride() internal pure override {}
}
