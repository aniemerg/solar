// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library EventLibL {
    event E();
}

library EventLibS {
    event E(uint256);
}

library EventLibT {
    event E();
}

interface EventInterfaceI {
    event E();
}

contract EventBaseB {
    event E();
}

contract EventDerivedD {
    event F();
}

contract EventSelector is EventDerivedD {
    function test1() external pure returns (bytes32, bytes32, bytes32, bytes32) {
        assert(EventLibL.E.selector == EventLibT.E.selector);
        assert(EventInterfaceI.E.selector == EventLibL.E.selector);
        assert(EventLibT.E.selector == EventInterfaceI.E.selector);
        assert(EventBaseB.E.selector == EventLibT.E.selector);

        assert(EventLibL.E.selector != EventLibS.E.selector);
        assert(EventLibT.E.selector != EventLibS.E.selector);
        assert(EventInterfaceI.E.selector != EventLibS.E.selector);
        assert(EventBaseB.E.selector != EventLibS.E.selector);

        return (EventLibL.E.selector, EventLibS.E.selector, EventInterfaceI.E.selector, EventBaseB.E.selector);
    }

    bytes32 s1 = EventLibL.E.selector;
    bytes32 s2 = EventLibS.E.selector;
    bytes32 s3 = EventLibT.E.selector;
    bytes32 s4 = EventInterfaceI.E.selector;
    bytes32 s5 = EventBaseB.E.selector;

    function test2() external view returns (bytes32, bytes32, bytes32, bytes32, bytes32) {
        return (s1, s2, s3, s4, s5);
    }

    function test3() external pure returns (bytes32) {
        return (F.selector);
    }
}
