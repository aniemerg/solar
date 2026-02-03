// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ByteArrayStorageLayout.sol";

contract ByteArrayStorageLayoutTest {
    function test_ByteArrayStorageLayout() public {
        ByteArrayStorageLayout c = new ByteArrayStorageLayout();

        uint256 shortValue = c.testShort();
        assert(
            shortValue
                == 1780731860627700044960722568376587075150542249149356309979516913770823710
        );

        uint256 longValue = c.testLong();
        assert(longValue == 67);

        uint256 popValue = c.testPop();
        assert(
            popValue
                == 1780731860627700044960722568376592200742329637303199754547598369979433020
        );
    }
}
