contract C {
    enum EnumType {A, B, C}

    struct StructType {
        uint x;
    }

    function f(StructType memory StructType) external {}
    function g(EnumType EnumType) external {}
    function h(EnumType StructType, StructType memory EnumType) external {} //~ ERROR: name has to refer to a valid user-defined type

    function z(EnumType e) external returns (uint EnumType) {}
}
