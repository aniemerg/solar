// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractBinaryDependenciesB {
    function f() public {}
}

contract ContractBinaryDependenciesA {
    function f() public {
        new ContractBinaryDependenciesB();
    }
}

contract ContractBinaryDependenciesC {
    function f() public {
        new ContractBinaryDependenciesB();
    }
}

contract ContractBinaryDependencies {
    ContractBinaryDependenciesA a = new ContractBinaryDependenciesA();
    ContractBinaryDependenciesC cc = new ContractBinaryDependenciesC();

    function run() public {
        a.f();
        cc.f();
    }
}
