// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateRandom {
    function addr() external view returns (address) {
        return address(this);
    }

    function testRunner() external returns (address a1, address a2) {
        assembly {
            // This is `return(0, 1)`. We are using a simplified/fixed initcode to avoid
            // instability due to metadata changes.
            let initcode := hex"60016000f3"
            mstore(0, initcode)

            a1 := create(0, 0, 5)
            a2 := create2(0, 0, 5, address())
        }
    }

    function testCalc() external view returns (address a1, address a2) {
        a1 = calculateCreate(address(this), 1);
        a2 = calculateCreate2(
            address(this),
            keccak256(hex"60016000f3"),
            bytes32(uint256(uint160(address(this))))
        );
    }

    function calculateCreate(address from, uint256 nonce) private pure returns (address) {
        assert(nonce <= 127);
        bytes memory data = bytes.concat(
            hex"d694",
            bytes20(uint160(from)),
            nonce == 0 ? bytes1(hex"80") : bytes1(uint8(nonce))
        );
        return address(uint160(uint256(keccak256(data))));
    }

    function calculateCreate2(address creator, bytes32 codehash, bytes32 salt)
        private
        pure
        returns (address)
    {
        return address(
            uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), creator, salt, codehash))))
        );
    }
}
