enum this {
    a
}
enum super {
    b
}
enum _ {
    c
}

enum E {
    this,
    super,
    _
}

contract C {
    this a; //~ ERROR: expected item, found builtin
    super b; //~ ERROR: expected item, found builtin
    _ c;
    E e;
}
