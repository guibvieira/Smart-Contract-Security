pragma solidity ^0.5.2;

contract Pausable {
    
    mapping (address => uint256) balances;
    address owner;
    
    bool private _paused;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    modifier isNotPaused(){
        require(!_paused);
        _;
    }
    
    modifier isPaused(){
        require(_paused);
        _;
    }

    constructor() public {
        owner = msg.sender;
        _paused = false;
    }
    
    function pause() public onlyOwner payable {
        if(!_paused){
            _paused = true;
        }
        else{
            _paused = false;
        }
    }
    
    function deposit() public isNotPaused payable{
        balances[msg.sender] += msg.value;
    }
    
    function withdrawAll() public isNotPaused {
        uint toWithdraw = balances[msg.sender];
        balances[msg.sender] = 0;
        msg.sender.transfer(toWithdraw);
    }
}