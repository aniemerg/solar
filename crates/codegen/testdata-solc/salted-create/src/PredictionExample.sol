// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract D {
    uint public x;

    constructor(uint a) {
        x = a;
    }
}

contract PredictionExample {
    function createDSalted(bytes32 salt, uint arg) public {
        address predictedAddress = address(
            uint160(
                uint(
                    keccak256(
                        abi.encodePacked(
                            bytes1(0xff),
                            address(this),
                            salt,
                            keccak256(abi.encodePacked(type(D).creationCode, arg))
                        )
                    )
                )
            )
        );

        D d = new D{salt: salt}(arg);
        require(address(d) == predictedAddress, "Address mismatch.");
    }
}
