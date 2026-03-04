// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface I {
    event E();
}

library L {
    function f() internal {
        emit I.E();
    }
}

contract EventEmitInterfaceEventViaLibrary {
    function g() public {
        L.f();
    }
}
