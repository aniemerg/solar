// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TstoreHiddenStaticcall {
    function f() internal {
        assembly {
            tstore(0, 0)
        }
    }
    function g() public view {
        function() internal ptr = f;
        function() internal view ptr2;
        assembly { ptr2 := ptr }
        ptr2(); // we force calling the non-view function, which should result in a revert during the staticcall
    }
    // Note: test() was removed from source to avoid forge running it as a standalone test.
    // The equivalent test is in TstoreHiddenStaticcall.t.sol:test_test().
    function callG() public {
        this.g(); // an external call to a view function should use static call
    }
}
