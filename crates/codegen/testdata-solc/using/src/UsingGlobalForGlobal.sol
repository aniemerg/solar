// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Combined from multi-source: A and B
// Original: type "global" (renamed to MyGlobal here to avoid keyword clash)
// A defines type with f attached globally; B defines g and uses both

type MyGlobal is uint;

function fInc(MyGlobal x) pure returns (MyGlobal) {
    return MyGlobal.wrap(MyGlobal.unwrap(x) + 1);
}

using {fInc} for MyGlobal global;

function gInc(MyGlobal x) pure returns (MyGlobal) {
    return MyGlobal.wrap(MyGlobal.unwrap(x) + 10);
}

contract UsingGlobalForGlobal {
    using {gInc} for MyGlobal;
    function run(MyGlobal r) public pure returns (MyGlobal) {
        return r.fInc().gInc();
    }
}
