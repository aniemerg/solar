// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InheritanceBaseOverloadBase {
    uint public x;
    uint public y;

    function init(uint a, uint b) public {
        x = a;
        y = b;
    }

    function init(uint a) public {
        x = a;
    }
}

contract InheritanceBaseOverload is InheritanceBaseOverloadBase {
    function cInit(uint c) public {
        InheritanceBaseOverloadBase.init(c);
    }

    function cInit(uint c, uint d) public {
        InheritanceBaseOverloadBase.init(c, d);
    }
}
