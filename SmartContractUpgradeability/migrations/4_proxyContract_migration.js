const ProxyDog = artifacts.require("ProxyDog");
const Dogs = artifacts.require("Dogs");

module.exports = function (deployer) {
  deployer.deploy(Dogs).then(function() {
    return deployer.deploy(ProxyDog, Dogs.address);
  });

};
