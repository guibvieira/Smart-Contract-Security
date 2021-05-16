pragma solidity 0.8.0;

import "./Storage.sol";

contract Dogs is Storage {

    function getNumberOfDogs() public view returns(uint256) {
        return Storage.getNumber();
    }

    function setNumberOfDogs(uint256 toSet) public {
        return Storage.setNumber(toSet + 1);
    }
}