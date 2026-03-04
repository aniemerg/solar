// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma abicoder v2;

import "../src/ElementsOfNestedArrayOfStructsCalldataToStorage.sol";

contract ElementsOfNestedArrayOfStructsCalldataToStorageTest {
    function test_ElementsOfNestedArrayOfStructsCalldataToStorage() public {
        ElementsOfNestedArrayOfStructsCalldataToStorage c = new ElementsOfNestedArrayOfStructsCalldataToStorage();

        // test1: input S[][][] with 1 outer element, 2 inner arrays, various structs
        ElementsOfNestedArrayOfStructsCalldataToStorage.S[][][] memory inp1 = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[][][](1);
        inp1[0] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[][](2);
        inp1[0][0] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[](1);
        inp1[0][0][0].a = new uint8[](1);
        inp1[0][0][0].a[0] = 3; inp1[0][0][0].a[0] = 7;
        inp1[0][0][0].b[0] = 1; inp1[0][0][0].b[1] = 2;
        inp1[0][1] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[](2);
        inp1[0][1][0].a = new uint8[](2);
        inp1[0][1][0].a[0] = 17; inp1[0][1][0].a[1] = 19;
        inp1[0][1][0].b[0] = 11; inp1[0][1][0].b[1] = 13;
        inp1[0][1][1].a = new uint8[](2);
        inp1[0][1][1].a[0] = 31; inp1[0][1][1].a[1] = 37;
        inp1[0][1][1].b[0] = 23; inp1[0][1][1].b[1] = 29;
        ElementsOfNestedArrayOfStructsCalldataToStorage.S[][] memory r1 = c.run1(inp1);
        assert(r1.length == 2);

        // test2
        ElementsOfNestedArrayOfStructsCalldataToStorage.S[][1][] memory inp2 = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[][1][](2);
        inp2[0][0] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[](1);
        inp2[0][0][0].a = new uint8[](2);
        inp2[0][0][0].a[0] = 17; inp2[0][0][0].a[1] = 19;
        inp2[0][0][0].b[0] = 11; inp2[0][0][0].b[1] = 13;
        inp2[1][0] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[](1);
        inp2[1][0][0].a = new uint8[](2);
        inp2[1][0][0].a[0] = 31; inp2[1][0][0].a[1] = 37;
        inp2[1][0][0].b[0] = 23; inp2[1][0][0].b[1] = 29;
        ElementsOfNestedArrayOfStructsCalldataToStorage.S[][1] memory r2 = c.run2(inp2);
        assert(r2[0].length == 1);

        // test3
        ElementsOfNestedArrayOfStructsCalldataToStorage.S[1][][2] memory inp3;
        inp3[0] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[1][](0);
        inp3[1] = new ElementsOfNestedArrayOfStructsCalldataToStorage.S[1][](2);
        inp3[1][0][0].a = new uint8[](1);
        inp3[1][0][0].a[0] = 3; inp3[1][0][0].b[0] = 1; inp3[1][0][0].b[1] = 2;
        inp3[1][1][0].a = new uint8[](2);
        inp3[1][1][0].a[0] = 17; inp3[1][1][0].a[1] = 19;
        inp3[1][1][0].b[0] = 11; inp3[1][1][0].b[1] = 13;
        ElementsOfNestedArrayOfStructsCalldataToStorage.S[1][] memory r3 = c.run3(inp3);
        assert(r3.length == 2);
    }
}
