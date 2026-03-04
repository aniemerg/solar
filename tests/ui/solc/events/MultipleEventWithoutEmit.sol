//@ compile-flags: -Ztypeck
contract test {
    event SetFirstElem(uint indexed elem);
    event SetSecondElem(uint indexed elem);
    function setVal() external  {
        emit SetFirstElem(0);
    }
    function setValX() external  {
        // There was a missing error for this case.
        // Whenever there was a proper invocation of events,
        // the compiler assumed that all the subsequent invocations
        // were proper.
        SetFirstElem(1); //~ ERROR: event invocations have to be prefixed by "emit"
    }
}
