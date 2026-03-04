// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct FunctionTypeCopyS {
    function() external[] functions;
}

contract FunctionTypeCopyHelper {
    function f(function() external[] calldata functions) external returns (FunctionTypeCopyS memory) {
        FunctionTypeCopyS memory s;
        s.functions = functions;
        return s;
    }
}

contract FunctionTypeCopy {
    FunctionTypeCopyHelper immutable helper = new FunctionTypeCopyHelper();

    function run() external returns (bool) {
        function() external[] memory functions = new function() external[](3);

        functions[0] = this.random1;
        functions[1] = this.random2;
        functions[2] = this.random3;

        FunctionTypeCopyS memory ret = helper.f(functions);

        assert(ret.functions.length == 3);
        assert(ret.functions[0] == this.random1);
        assert(ret.functions[1] == this.random2);
        assert(ret.functions[2] == this.random3);

        return true;
    }

    function random1() external {}

    function random2() external {}

    function random3() external {}
}
