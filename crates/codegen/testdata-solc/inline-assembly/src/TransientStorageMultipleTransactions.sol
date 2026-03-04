// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransientStorageMultipleTransactions {
    function set(uint value) private {
        assembly {
            tstore(0, value)
        }
    }

    function get() private view returns (uint value) {
        assembly {
            value := tload(0)
        }
    }

    function f() external {
        assembly {
            tstore(0, 42)
        }
    }

    function g() external view returns(uint r) {
        assembly {
            r := tload(0)
        }
    }

    function h() external returns (uint x) {
        set(99);
        x = get();
    }
}
