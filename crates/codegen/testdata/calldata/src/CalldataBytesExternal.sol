// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataBytesExternal {
    function echo(bytes calldata x) public pure returns (bytes calldata) {
        return x;
    }

    function probe(bytes calldata x) public view returns (bytes1) {
        return this.echo(x)[2];
    }
}
