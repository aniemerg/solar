// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() internal virtual {
        mutableWithViewOverride();
        mutableWithPureOverride();
        viewWithPureOverride();
    }

    function mutableWithViewOverride() public virtual {}

    function mutableWithPureOverride() public virtual {}

    function viewWithPureOverride() public view virtual {}
}

contract VirtualOverrideChangingMutabilityPublic is A {
    function run() public {
        f();
    }

    function mutableWithViewOverride() public view override {}

    function mutableWithPureOverride() public pure override {}

    function viewWithPureOverride() public pure override {}
}
