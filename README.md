# Smart-Contract-Security
Learning about smart contract security


## Different Ways of Sending Ether

```
yourAddress.send(x)
//Safe against re-entrency
//2300 Gas Stipend - a limit, just enough for the fallback function to send an event

yourAddress.transfer(x)
//Safe against re-entrency
//Same as send() but in-built require() which reverts the transactions upon failure

yourAddress.call.value(x)()
//Unlimited gas to fallback function
```

## Different types of contract calls

```
//Contract A is interacting with Contract B

ContractB.call()
//Call a function to External contract
//Using contract B scope
//Throws an error if it fails
//returns true/false

ContractB.callcode()
//Call a function in External Contract
//Using ContractA Scope
//Throws an error if it fails
//Returns true or false
//Prone to errors

ContractB.delegatecall()
//Call a function in External Contract
//Using ContractA Scope
//Throws an error if it fails
//Returns true or false

ContractB.functionName() -> Recommended way to run functions
//Call a function in External Contract
//Will throw an error if functionName throws

To run the call() and delegatecall(), would be run like the following:
ContractB.call(bytes4(sha3("runFunction(uint256)"), 100)
```

