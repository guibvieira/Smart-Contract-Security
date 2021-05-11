pragma solidity ^0.4.8;

contract Library{
    
    address owner;
    
    function isNotPositive(uint number) returns (bool){
        if(number<=0){
            return true;
        }
        return false;
    }
    
    //once you are an owner you could destroy the library breaking the functionality inherited in the other contracts
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
    
    modifier onlyOwner {
        if(msg.sender != owner){
            throw;
        }
        _;
    }
    
    //this function allowed anyone to set themselves as owner if initOwner had not been executed before
    function initOwner(){
        if(owner==address(0)){
            owner = msg.sender;
        }
        else{
            throw;
        }
    }
    
}