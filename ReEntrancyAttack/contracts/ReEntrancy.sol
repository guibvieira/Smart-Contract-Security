// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;



contract ReEntrancy {
//insecure code
  mapping(address => uint) balances;

  function withdrawAll() public {
     //will trigger the fallback function of the malicious contractwhich calls withdrawAll again
     //, causing an endless loop until contract is empty
    uint amountToWithdraw = balances[msg.sender];
    require(msg.sender.call.value(amountToWithdraw)()); //re-entrancy vulnerability
    balances[msg.sender] = 0; //code never gets here so the balance is never set to 0 
  }

}
