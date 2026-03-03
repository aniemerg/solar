// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inlined from A.sol
error ErrorA(string msg);

// Inlined from B.sol (ErrorB at file scope and inside BContract)
error ErrorB(string msg);

contract BContract {
    error ErrorB(string msg);
}

// Equivalent of CContract from C.sol, referencing B and B.BContract and B.A
contract ErrorThrowFromModuleViaMemberAccess {
    function error1() external {
        revert ErrorB("B error");
    }

    function error2() external {
        revert BContract.ErrorB("B.BContract error");
    }

    function error3() external {
        revert ErrorA("B.A error");
    }
}
