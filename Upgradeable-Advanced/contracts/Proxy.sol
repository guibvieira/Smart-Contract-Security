pragma solidity 0.5.2;

import "./Storage.sol";

contract Proxy is Storage {

  address currentAddress;

  constructor(address _currentAddress) public {
    owner = msg.sender;
    currentAddress = _currentAddress;
  }
  function upgrade(address _newAddress) public {
    require(msg.sender == owner);
    currentAddress = _newAddress;
  }

  //FALLBACK FUNCTION.
  function () payable external {
    address implementation = currentAddress;
    require(currentAddress != address(0));
    bytes memory data = msg.data;

    //DELEGATECALL EVERY FUNCTION CALL
    //add (data, 0x20) 2 in Hex, so the value is changed to something delegatecall can actually read
    //mload memory load function - load data into memory
    assembly{
        let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
        let size := returndatasize()
        let ptr := mload("0x40") //pointer into the memory of the computer
        returndatacopy(ptr, 0, size)
        // switch 0 if the result call has failed, 1 if it has been succesfull
        switch result
        case 0 {revert(ptr, size)}
        default {return(ptr, size)}
    }
}