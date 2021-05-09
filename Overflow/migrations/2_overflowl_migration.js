const OverflowWithSafeMath = artifacts.require("OverflowWithSafeMath");

module.exports = function (deployer) {
  deployer.deploy(OverflowWithSafeMath);
};
