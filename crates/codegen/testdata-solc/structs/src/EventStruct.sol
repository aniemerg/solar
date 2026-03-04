// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct EventItem {
    uint x;
}

library EventStructLib {
    event Ev(EventItem);

    function o() public {
        emit EventStructLib.Ev(EventItem(1));
    }
}

contract EventStruct {
    function f() public {
        EventStructLib.o();
    }
}
