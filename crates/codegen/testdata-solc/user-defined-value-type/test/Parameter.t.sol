// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Parameter.sol";

contract ParameterTest {
    function test_id() public {
        Parameter c = new Parameter();
        assert(MyAddress.unwrap(c.id(MyAddress.wrap(address(5)))) == address(5));
        address maxAddr = 0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF;
        assert(MyAddress.unwrap(c.id(MyAddress.wrap(maxAddr))) == maxAddr);
    }

    function test_unwrap() public {
        Parameter c = new Parameter();
        assert(c.unwrap(MyAddress.wrap(address(5))) == address(5));
        address maxAddr = 0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF;
        assert(c.unwrap(MyAddress.wrap(maxAddr)) == maxAddr);
    }

    function test_wrap() public {
        Parameter c = new Parameter();
        assert(MyAddress.unwrap(c.wrap(address(5))) == address(5));
        address maxAddr = 0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF;
        assert(MyAddress.unwrap(c.wrap(maxAddr)) == maxAddr);
    }

    function test_assemblyAccess() public {
        Parameter c = new Parameter();
        assert(c.unwrap_assembly(MyAddress.wrap(address(5))) == address(5));
        assert(MyAddress.unwrap(c.wrap_assembly(address(5))) == address(5));
    }
}
