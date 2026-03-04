// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/PrbmathSigned.sol";

contract PrbmathSignedTest {
    PrbmathSigned c;

    function setUp() public {
        c = new PrbmathSigned();
    }

    function test_div() public view {
        assert(c.div(3141592653589793238, 88714123) == 35412542528203691288251815328);
    }

    function test_exp() public view {
        assert(c.exp(3141592653589793238) == 23140692632779268978);
    }

    function test_exp2() public view {
        assert(c.exp2(3141592653589793238) == 8824977827076287620);
    }

    function test_gm() public view {
        assert(c.gm(3141592653589793238, 88714123) == 16694419339601);
    }

    function test_log10() public view {
        assert(c.log10(3141592653589793238) == 4971498726941338506);
    }

    function test_log2() public view {
        assert(c.log2(3141592653589793238) == 1651496129472318782);
    }

    function test_mul() public view {
        assert(c.mul(3141592653589793238, 88714123) == 278703637);
    }

    function test_pow() public view {
        assert(c.pow(3141592653589793238, 5) == 306019684785281453040);
    }

    function test_sqrt() public view {
        assert(c.sqrt(3141592653589793238) == 1772453850905516027);
    }

    function test_benchmark() public view {
        (int256 ret, int256 z1, int256 z2) = c.benchmark(3141592653589793238);
        assert(ret == 998882724338592125);
        assert(z1 == 1000000000000000000);
        assert(z2 == 1000000000000000000);
    }
}
