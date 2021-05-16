

pragma solidity 0.8.0;

contract Storage {
    //contract will hold the storage of the functional contract
 
    uint number;

    function getNumber() internal view returns (uint){
        return number;
    }

    function setNumber(uint256 _number) internal {
        number = _number;
    }   
}