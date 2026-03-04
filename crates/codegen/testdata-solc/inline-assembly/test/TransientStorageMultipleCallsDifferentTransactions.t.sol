// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/TransientStorageMultipleCallsDifferentTransactions.sol";

contract TransientStorageMultipleCallsDifferentTransactionsTest is Test {
    TransientStorageMultipleCallsDifferentTransactions c;

    function setUp() public {
        c = new TransientStorageMultipleCallsDifferentTransactions();
    }

    // test() ->  (runs once - verifies transient storage ops within a transaction)
    function test_test_once() public {
        c.test(); // Should not revert
    }

    // Calling test() twice in separate test fns simulates separate transactions
    // test_test_second is a separate test function = separate tx = tstore reset
    function test_test_second() public {
        c.test(); // Should not revert (fresh transient storage)
    }
}
