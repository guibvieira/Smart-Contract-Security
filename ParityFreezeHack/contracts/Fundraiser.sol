pragma solidity ^0.4.8;
import "./Library.sol";

contract Fundraiser{
    
    Library lib = Library(0xbbf289d846208c16edc8474705c748aff07732db);
    
    mapping  (address => uint) balances;
    
    function contribute() payable{
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(){
        //Onde the library was killed, this functionality would not work anymore and no one would be able to withdraw funds
        // Even if library re-deploys, we would not be able to change the library address on this contract without re-deploying as well
        if(lib.isNotPositive(balances[msg.sender])){
            throw;
        }
        
        balances[msg.sender] = 0;
        msg.sender.call.value(balances[msg.sender])();
    }
    
    function getFunds() returns (uint){
        return address(this).balance;
    }
    
}
