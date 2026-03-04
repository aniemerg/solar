//@ compile-flags: -Ztypeck
contract A {
    function getData() public view returns (bytes memory) {
        return msg.data;
    }

    function getDataPure() public pure returns (bytes memory) {
        return hex"ffff";
    }

    bytes constant abData = bytes.concat(hex"aaaa", hex"bbbb", msg.data); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
    bytes constant abgetData = bytes.concat(hex"aaaa", hex"bbbb", getData()); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
    bytes constant abgetDataPure = bytes.concat(hex"aaaa", hex"bbbb", getDataPure()); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 0
}
