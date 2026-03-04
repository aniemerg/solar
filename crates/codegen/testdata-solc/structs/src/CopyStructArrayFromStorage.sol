// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct CopyStructArrayS {
    uint value;
}

contract CopyStructArrayFromStorage {
    CopyStructArrayS[][] a;
    CopyStructArrayS[] b;

    constructor() {
        a.push();
        a[0].push(CopyStructArrayS(1));
        a[0].push(CopyStructArrayS(2));
        a[0].push(CopyStructArrayS(3));

        b.push(CopyStructArrayS(4));
        b.push(CopyStructArrayS(5));
        b.push(CopyStructArrayS(6));
        b.push(CopyStructArrayS(7));
    }

    function run1() external returns (bool) {
        a.push();
        a[1] = b;

        assert(a.length == 2);
        assert(a[0].length == 3);
        assert(a[1].length == 4);
        assert(a[1][0].value == 4);
        assert(a[1][1].value == 5);
        assert(a[1][2].value == 6);
        assert(a[1][3].value == 7);

        return true;
    }

    function run2() external returns (bool) {
        CopyStructArrayS[][] memory temp = new CopyStructArrayS[][](2);

        temp = a;

        assert(temp.length == 2);
        assert(temp[0].length == 3);
        assert(temp[1].length == 4);
        assert(temp[1][0].value == 4);
        assert(temp[1][1].value == 5);
        assert(temp[1][2].value == 6);
        assert(temp[1][3].value == 7);

        return true;
    }

    function run3() external returns (bool) {
        CopyStructArrayS[][] memory temp = new CopyStructArrayS[][](2);

        temp[0] = a[0];
        temp[1] = a[1];

        assert(temp.length == 2);
        assert(temp[0].length == 3);
        assert(temp[1].length == 4);
        assert(temp[1][0].value == 4);
        assert(temp[1][1].value == 5);
        assert(temp[1][2].value == 6);
        assert(temp[1][3].value == 7);

        return true;
    }

    function run4() external returns (bool) {
        CopyStructArrayS[][] memory temp = new CopyStructArrayS[][](2);

        temp[0] = a[0];
        temp[1] = b;

        assert(temp.length == 2);
        assert(temp[0].length == 3);
        assert(temp[1].length == 4);
        assert(temp[1][0].value == 4);
        assert(temp[1][1].value == 5);
        assert(temp[1][2].value == 6);
        assert(temp[1][3].value == 7);

        return true;
    }
}
