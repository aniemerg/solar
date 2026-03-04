// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfdestructPostCancunMBCHelper {
    constructor() payable {}

    function terminate(address _beneficiary) public {
        selfdestruct(payable(_beneficiary));
    }
}

contract SelfdestructPostCancunMultipleBeneficiaries {
    SelfdestructPostCancunMBCHelper public c;

    constructor() payable {}

    function deploy() public payable {
        c = new SelfdestructPostCancunMBCHelper{value: 1 ether}();
    }

    function terminate(address _beneficiary) public {
        c.terminate(_beneficiary);
    }

    function exists() public view returns (bool) {
        return address(c).code.length != 0;
    }
}
