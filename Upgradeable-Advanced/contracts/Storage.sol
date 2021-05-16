pragma solidity 0.5.2;

contract Storage {
  //contract will hold the storage of the functional contract
  mapping (string => uint256) _uintStorage;
  mapping (string => address) _addressStorage;
  mapping (string => bool) _boolStorage;
  mapping (string => string) _stringStorage;
  mapping (string => bytes4) _bytesStorage;
  address public owner;
  bool public _initialized;
}