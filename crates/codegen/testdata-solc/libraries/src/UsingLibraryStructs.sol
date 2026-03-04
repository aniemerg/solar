// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibStructs {
    struct Data { uint256 a; uint256[] b; }

    function set(Data storage _s) public {
        _s.a = 7;
        while (_s.b.length < 20)
            _s.b.push();
        _s.b[19] = 8;
    }
}

contract UsingLibraryStructs {
    mapping(string => LibStructs.Data) data;

    function f() public returns (uint256 a, uint256 b) {
        LibStructs.set(data["abc"]);
        a = data["abc"].a;
        b = data["abc"].b[19];
    }
}
