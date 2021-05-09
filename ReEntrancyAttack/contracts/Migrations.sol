pragma solidity >=0.4.22 <0.9.0;

contract ReEntrancy {
//insecure code
  mapping(address => uint) balances;

  function withdrawAll() public {
    uint amountToWithdraw = balances[msg.sender];
    require(msg.sender.call.value(amountToWithdraw)()); //will trigger the fallback function of the malicious contract, causing an endless loop until contract is empty
    balances[msg.sender] = 0;
  }

}
