// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Lib {
    function find(uint16[] storage _haystack, uint16 _needle) public view returns (uint256) {
        for (uint256 i = 0; i < _haystack.length; ++i)
            if (_haystack[i] == _needle)
                return i;
        return type(uint256).max;
    }
}

contract InternalTypesInLibrary {
    mapping(string => uint16[]) data;

    function f() public returns (uint256 a, uint256 b) {
        while (data["abc"].length < 20)
            data["abc"].push();
        data["abc"][4] = 9;
        data["abc"][17] = 3;
        a = Lib.find(data["abc"], 9);
        b = Lib.find(data["abc"], 3);
    }
}
