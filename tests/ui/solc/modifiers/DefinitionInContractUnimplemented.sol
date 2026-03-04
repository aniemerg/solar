contract C {
    modifier mu; //~ ERROR: functions without implementation must be marked virtual
    modifier muv virtual;
}
