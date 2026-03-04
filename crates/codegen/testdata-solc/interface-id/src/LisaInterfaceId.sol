// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

abstract contract ERC165MappingImplementation is ERC165 {
    mapping(bytes4 => bool) internal supportedInterfaces;

    constructor() {
        supportedInterfaces[this.supportsInterface.selector] = true;
    }

    function supportsInterface(bytes4 interfaceID) external view override returns (bool) {
        return supportedInterfaces[interfaceID];
    }
}

interface Simpson {
    function is2D() external returns (bool);
    function skinColor() external returns (string memory);
}

contract LisaInterfaceId is ERC165MappingImplementation, Simpson {
    constructor() {
        supportedInterfaces[type(Simpson).interfaceId] = true;
    }

    function is2D() external override returns (bool) {
        return true;
    }

    function skinColor() external override returns (string memory) {
        return "yellow";
    }
}
