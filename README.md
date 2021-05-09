# Smart-Contract-Security
Learning about smart contract security


# Different Ways of Sending Ether

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