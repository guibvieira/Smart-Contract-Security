const Dogs = artifacts.require("Dogs");

module.exports = function (deployer) {
  deployer.deploy(Dogs);
};
