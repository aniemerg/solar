contract C {
    enum EnumType {A, B, C}

    struct StructType {
        uint x;
    }

    function f() external returns (StructType memory StructType) {}
    function g() external returns (EnumType EnumType) {}
    function h() external returns (EnumType StructType, StructType memory EnumType) {} //~ ERROR: name has to refer to a valid user-defined type

    function z(uint EnumType) external returns (EnumType e) {} //~ ERROR: name has to refer to a valid user-defined type
}
