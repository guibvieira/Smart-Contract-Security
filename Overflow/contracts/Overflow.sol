pragma solidity 0.4.0; //version with these vulnerabilities

contract Overflow {

    mapping(address => uint ) balances;

    function contribute() payable {
        balances[msg.sender] = msg.value;
    }

    function getBalance() public returns(uint) {
        return balances[msg.sender];
    }

    function batchSend(address[] _receivers, uint _value){
        //this line can cause overflow
        uint total = _receivers.length * _value;
        require(balances[msg.sender] >= total);

        //subtract from sender
        balances[msg.sender] -= total;

        for (uint256 i = 0; i < _receivers.length; i++) {
            balances[_receivers[i]] += _value; //receivers are allowed to receive huge _value number as a result of the overfow
        }
    }
}