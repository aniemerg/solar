// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/EventSignatureInLibrary.sol";

contract EventSignatureInLibraryTest {
    function test_constructor() public {
        // Emits E((uint8,int16),(uint8,int16)) during construction; verify deployment succeeds
        new EventSignatureInLibrary();
    }
}
