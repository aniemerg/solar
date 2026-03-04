// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct DataMod {
    uint value;
}

contract AMod {
    function get() public view returns (DataMod memory) {
        return DataMod(5);
    }
}

contract BMod {
    uint x = 10;
    uint y = 10;

    modifier updateStorage() {
        AMod a = new AMod();
        x = a.get().value;
        _;
        y = a.get().value;
    }
}

contract CMod is BMod {
    function test()
        public
        updateStorage
        returns (uint, uint)
    {
        return (x, y);
    }
}
