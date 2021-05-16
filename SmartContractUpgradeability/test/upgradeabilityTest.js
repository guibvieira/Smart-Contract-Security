
const ProxyDog = artifacts.require("ProxyDog");
const Dogs = artifacts.require("Dogs");
const DogsUpgraded = artifacts.require("DogsUpgraded");
const truffleAssert = require("truffle-assertions");

contract("ProxyDog", accounts => {
    it("should be possible to use proxy contract and then upgrade successfully after fixing bug", async () => {
        let dogs = await Dogs.deployed();
        let dogsUpgraded = await DogsUpgraded.deployed();
        let proxyDog = await ProxyDog.deployed();

        let address = await proxyDog.currentAddress();
        
        let res1 = await proxyDog.setNumberOfDogs(5);
        let result = await proxyDog.getNumberOfDogs();
        // console.log('res', res)
        // const {0: boolValue, 1: boolValue} = result;
        console.log('res', result);
        // console.log('res', boolValue)
        await truffleAssert.reverts(
            dogNumber.toNumber()
        )

        //now that we realise there is a bug, we can upgrade the dogs contract and just modify the currentAddress in the Proxy contract
        await proxyDog.upgrade(dogsUpgraded.address);
        await proxyDog.setNumberOfDogs(5); //update the storage so we can overwrite the bug that was previously there
        let [success2, dogNumberFixed] = await proxyDog.getNumberOfDogs();
        await truffleAssert.reverts(
            dogNumberFixed.toNumber()
        )
    });
  
})