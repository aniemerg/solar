// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface Simpson {
    function is2D() external returns (bool);
    function skinColor() external returns (string memory);
}

contract Homer is ERC165, Simpson {
    function supportsInterface(bytes4 interfaceID) external view override returns (bool) {
        return
            interfaceID == this.supportsInterface.selector || // ERC165
            interfaceID == this.is2D.selector ^ this.skinColor.selector; // Simpson
    }

    function is2D() external override returns (bool) {
        return true;
    }

    function skinColor() external override returns (string memory) {
        return "yellow";
    }
}
