// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOfRecursiveStruct {
    struct RecursiveStruct {
        RecursiveStruct[] vals;
    }

    function func() public pure {
        RecursiveStruct[1] memory val = [RecursiveStruct(new RecursiveStruct[](42))];
        assert(val[0].vals.length == 42);
    }
}
