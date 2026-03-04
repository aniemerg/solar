// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type Bool is bool;
using {add as +, mul as *, unsub as -} for Bool global;

function add(Bool x, Bool y) pure returns (Bool) {
    return Bool.wrap(Bool.unwrap(x) || Bool.unwrap(y));
}

function mul(Bool x, Bool y) pure returns (Bool) {
    return Bool.wrap(Bool.unwrap(x) && Bool.unwrap(y));
}

function unsub(Bool x) pure returns (Bool) {
    return Bool.wrap(!Bool.unwrap(x));
}

contract C {
    event Wrapped(uint);
    event Probe(Bool);

    function toBool(uint x) public returns (Bool) {
        emit Wrapped(x);
        return Bool.wrap(x > 0);
    }

    function probe(Bool x) public returns (Bool) {
        emit Probe(x);
        return x;
    }

    function testSingleOperator() public {
        toBool(0) +
        (toBool(1) + toBool(2)) +
        toBool(3);
    }

    function testTwoBinaryOperators() public {
        toBool(0) * toBool(1) +
        (toBool(2) * toBool(3)) +
        toBool(4) * toBool(5);
    }

    function testBinaryAndUnaryOperators() public {
        -toBool(0) * -toBool(1) +
        (-toBool(2) * -toBool(3)) +
        -toBool(4) * -toBool(5);
    }

    function testOperatorsNestedInCalls() public {
        -probe(toBool(0) * -toBool(1)) +
        (-probe(toBool(2) * -toBool(3))) +
        -probe(toBool(4) * -toBool(5));
    }
}
