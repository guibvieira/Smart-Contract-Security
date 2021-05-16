pragma solidity 0.8.0;

import "./Storage.sol";

contract DogsUpgraded is Storage {
    //this contract intended to fix FunctionalContract which had a bug purposefuly included in it 

    function getNumberOfDogs() public view returns(uint256) {
        return Storage.getNumber();
    }

    function setNumberOfDogs(uint256 toSet) public {
        return Storage.setNumber(toSet);
    }
}