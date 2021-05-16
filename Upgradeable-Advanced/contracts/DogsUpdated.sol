pragma solidity 0.5.2;

import "./Dogs.sol";

contract DogsUpdated is Dogs {
    //doing this way is safer as you only add the new functionality 
    //while maintaining the desired fucntionality from the old contract as well as preserving its storage

  constructor() public {
    initialize(msg.sender);
  }

  function initialize(address _owner) public {
    require(!_initialized);
    owner = _owner;
    _initialized = true;
  }
}