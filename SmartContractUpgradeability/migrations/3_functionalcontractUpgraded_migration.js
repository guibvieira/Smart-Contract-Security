const DogsUpgraded = artifacts.require("DogsUpgraded");

module.exports = function (deployer) {
  deployer.deploy(DogsUpgraded);
};
