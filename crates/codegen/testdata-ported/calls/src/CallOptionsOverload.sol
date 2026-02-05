// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallOptionsOverload {
    function f(uint256) external payable returns (uint256) { return 1; }
    function f(uint256, uint256) external payable returns (uint256) { return 2; }

    function call() public payable returns (uint256 v, uint256 x, uint256 y, uint256 z) {
        v = this.f{value: 10}(2);
        x = this.f{gas: 10000}(2, 3);
        y = this.f{gas: 10000, value: 10}(2, 3);
        z = this.f{value: 10, gas: 10000}(2, 3);
    }

    function bal() external view returns (uint256) { return address(this).balance; }

    receive() external payable {}
}
