// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract C {
    type T is uint;
}

contract WrapUnwrapViaContractName {
    function f(C.T x) public pure returns (uint) {
        return C.T.unwrap(x);
    }
    function g(uint x) public pure returns (C.T) {
        return C.T.wrap(x);
    }
    function h(uint x) public pure returns (uint) {
        return f(g(x));
    }
    function i(C.T x) public pure returns (C.T) {
        return g(f(x));
    }
}
