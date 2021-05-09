pragma solidity >=0.4.22 <0.9.0;


contract ReEntrancyFixed {
//insecure code
  mapping(address => uint) balances;

//CHECKS, EFFECTS, INTERACTIONS pattern
  function withdrawAll() public {
    uint amountToWithdraw = balances[msg.sender];
    balances[msg.sender] = 0;
    require(msg.sender.call.value(amountToWithdraw)()); //will trigger the fallback function of the malicious contract, causing an endless loop until contract is empty
  }

}