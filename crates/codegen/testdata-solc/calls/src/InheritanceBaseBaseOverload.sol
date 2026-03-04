// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseBase {
    uint public x;
    uint public y;

    function init(uint a, uint b) public virtual {
        x = b;
        y = a;
    }

    function init(uint a) public virtual {
        x = a + 1;
    }
}

contract Base is BaseBase {
    function init(uint a, uint b) public override {
        x = a;
        y = b;
    }

    function init(uint a) public override {
        x = a;
    }
}

contract InheritanceBaseBaseOverload is Base {
    function cInit(uint c) public {
        Base.init(c);
    }

    function cInit(uint c, uint d) public {
        Base.init(c, d);
    }

    function bInit(uint c) public {
        BaseBase.init(c);
    }

    function bInit(uint c, uint d) public {
        BaseBase.init(c, d);
    }
}
