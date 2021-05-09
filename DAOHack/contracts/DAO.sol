// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract DAO {

    mapping(address => uint) balances;

    function contribute() public payable {
        balances[msg.sender] += msg.value;
    }   

    function withdraw() public {
        if (balances[msg.sender] == 0){
            throw;
        } 
        if(msg.sender.call.value(balances[msg.sender])("")){
            balances[msg.sender] = 0;
        }
        else {
            throw;
        }
    }

    function getFunds() public returns(uint){
        return address(this).balance;
    }
  
}
