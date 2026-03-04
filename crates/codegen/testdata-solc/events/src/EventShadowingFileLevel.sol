// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

event E();

library L1 {
    event E(string);
}

library L2 {
    event E();
}

library K {
    function main() internal pure returns (bytes32, bytes32, bytes32) {
        // Here E is the global event.
        assert(E.selector != L1.E.selector);
        assert(E.selector == L2.E.selector);

        return (E.selector, L1.E.selector, L2.E.selector);
    }
}

contract EventShadowingFileLevel {
    event E(string);

    function main() external pure returns (bytes32, bytes32, bytes32) {
        // Here E is the local event.
        assert(E.selector == L1.E.selector);
        assert(E.selector != L2.E.selector);

        return (E.selector, L1.E.selector, L2.E.selector);
    }

    function k_main() external pure returns (bytes32, bytes32, bytes32) {
        return K.main();
    }
}
