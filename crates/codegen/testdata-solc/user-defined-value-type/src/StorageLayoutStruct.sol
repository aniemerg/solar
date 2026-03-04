// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt64 is int64;
struct HalfSlot {
    MyInt64 a;
    MyInt64 b;
}

struct RegularHalfSlot {
    int64 a;
    int64 b;
}

type MyAddress is address;
type MyInt96 is int96;
struct FullSlot {
    MyInt96 a;
    MyAddress b;
}
struct RegularFullSlot {
    int96 a;
    address b;
}

contract StorageLayoutStruct {
    HalfSlot public a;
    RegularHalfSlot public ra;

    HalfSlot public b;
    RegularHalfSlot public rb;

    HalfSlot public c;
    RegularHalfSlot public rc;

    FullSlot public d;
    RegularFullSlot public rd;

    function storage_a() pure external returns (uint slot, uint offset) {
        assembly { slot := a.slot  offset := a.offset }
    }
    function storage_ra() pure external returns (uint slot, uint offset) {
        assembly { slot := ra.slot  offset := ra.offset }
    }
    function storage_b() pure external returns (uint slot, uint offset) {
        assembly { slot := b.slot  offset := b.offset }
    }
    function storage_rb() pure external returns (uint slot, uint offset) {
        assembly { slot := rb.slot  offset := rb.offset }
    }
    function storage_c() pure external returns (uint slot, uint offset) {
        assembly { slot := c.slot  offset := c.offset }
    }
    function storage_rc() pure external returns (uint slot, uint offset) {
        assembly { slot := rc.slot  offset := rc.offset }
    }
    function storage_d() pure external returns (uint slot, uint offset) {
        assembly { slot := d.slot  offset := d.offset }
    }
    function storage_rd() pure external returns (uint slot, uint offset) {
        assembly { slot := rd.slot  offset := rd.offset }
    }

    function set_a(MyInt64 _a, MyInt64 _b) external { a.a = _a; a.b = _b; }
    function set_ra(int64 _a, int64 _b) external { ra.a = _a; ra.b = _b; }
    function set_b(MyInt64 _a, MyInt64 _b) external { b.a = _a; b.b = _b; }
    function set_rb(int64 _a, int64 _b) external { rb.a = _a; rb.b = _b; }
    function set_c(MyInt64 _a, MyInt64 _b) external { c.a = _a; c.b = _b; }
    function set_rc(int64 _a, int64 _b) external { rc.a = _a; rc.b = _b; }
    function set_d(MyInt96 _a, MyAddress _b) external { d.a = _a; d.b = _b; }
    function set_rd(int96 _a, address _b) external { rd.a = _a; rd.b = _b; }

    function read_slot(uint slot) view external returns (uint value) {
        assembly { value := sload(slot) }
    }

    function read_contents_asm() external returns (bytes32 rxa, bytes32 rya, bytes32 rxb, bytes32 ryb) {
        b.a = MyInt64.wrap(-2);
        b.b = MyInt64.wrap(-3);
        HalfSlot memory x = b;
        MyInt64 y = b.a;
        MyInt64 z = b.b;
        assembly {
            rxa := mload(x)
            rya := y
            rxb := mload(add(x, 0x20))
            ryb := z
        }
    }
}
