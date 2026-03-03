// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchNested {
    function g(bool b) public pure returns (uint, uint) {
        require(b, "failure");
        return (1, 2);
    }
    function f(bool cond1, bool cond2) public returns (uint x, uint y, bytes memory txt) {
        try this.g(cond1) returns (uint a, uint b) {
            try this.g(cond2) returns (uint a2, uint b2) {
                (x, y) = (a, b);
                txt = "success";
            } catch Error(string memory s) {
                x = 12;
                txt = bytes(s);
            } catch (bytes memory s) {
                x = 13;
                txt = s;
            }
        } catch Error(string memory s) {
            x = 99;
            txt = bytes(s);
        } catch (bytes memory s) {
            x = 98;
            txt = s;
        }
    }
}
