// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface Simpson {
    function is2D() external returns (bool);
    function skinColor() external returns (string memory);
}

contract HomerInterfaceId is ERC165, Simpson {
    function supportsInterface(bytes4 interfaceID) external view override returns (bool) {
        return
            interfaceID == type(ERC165).interfaceId ||
            interfaceID == type(Simpson).interfaceId;
    }

    function is2D() external override returns (bool) {
        return true;
    }

    function skinColor() external override returns (string memory) {
        return "yellow";
    }
}
