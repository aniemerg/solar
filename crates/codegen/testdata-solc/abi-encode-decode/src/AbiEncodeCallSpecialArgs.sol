// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeCallSpecialArgs {
    function fNoArgs() external {}
    function fArray(uint[] memory x) external {}
    function fUint(uint x, uint y) external pure returns (uint a, uint b) {}

    function fSignatureFromLiteralNoArgs() public pure returns (bytes memory) {
        return abi.encodeWithSignature("fNoArgs()");
    }
    function fPointerNoArgs() public view returns (bytes memory) {
        return abi.encodeCall(this.fNoArgs, ());
    }

    function fSignatureFromLiteralArray() public pure returns (bytes memory) {
        uint[] memory x;
        return abi.encodeWithSignature("fArray(uint256[])", x);
    }
    function fPointerArray() public view returns (bytes memory) {
        uint[] memory x;
        return abi.encodeCall(this.fArray, x);
    }

    function fSignatureFromLiteralUint() public pure returns (bytes memory) {
        return abi.encodeWithSignature("fUint(uint256,uint256)", 12, 13);
    }
    function fPointerUint() public view returns (bytes memory) {
        return abi.encodeCall(this.fUint, (12,13));
    }

    function assertConsistentSelectors() public view {
        assert(keccak256(fSignatureFromLiteralNoArgs()) == keccak256(fPointerNoArgs()));
        assert(keccak256(fSignatureFromLiteralArray()) == keccak256(fPointerArray()));
        assert(keccak256(fSignatureFromLiteralUint()) == keccak256(fPointerUint()));
    }
}
