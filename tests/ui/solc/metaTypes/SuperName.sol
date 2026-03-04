//@ compile-flags: -Ztypeck
pragma abicoder v2;

function compareStrings(string memory s1, string memory s2) returns (bool) {
    return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
}

contract A {
    string[] r;
    function f() public virtual returns (bool) {
        r.push("");

        return false;
    }
}


contract B is A {
    function f() public virtual override returns (bool) {
        super.f();
        r.push(type(super).name); //~ ERROR: expected item, found builtin

        return false;
    }
}


contract C is A {
    function f() public virtual override returns (bool) {
        super.f();
        r.push(type(super).name); //~ ERROR: expected item, found builtin

        return false;
    }
}


contract D is B, C {
    function f() public override(B, C) returns (bool) {
        super.f();
        r.push(type(super).name); //~ ERROR: expected item, found builtin
        // Order of calls: D.f, C.f, B.f, A.f
        // r contains "", "A", "B", "C"
        assert(r.length == 4);
        assert(compareStrings(r[0], ""));
        assert(compareStrings(r[1], "A"));
        assert(compareStrings(r[2], "B"));
        assert(compareStrings(r[3], "C"));

        return true;
    }
}
