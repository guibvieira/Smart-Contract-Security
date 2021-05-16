pragma solidity 0.8.0;

import "./Storage.sol";
contract ProxyDog is Storage{
    address public currentAddress;

    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function upgrade(address _newAddress) public {
        currentAddress = _newAddress;
    }

    function getNumberOfDogs() public returns (bytes memory){
        (, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfDogs()"))));
        return data;
    }
    function setNumberOfDogs(uint256 _number) public returns (bytes memory){
        (, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfDogs(uint256)")), _number));
        return data;
    }
}