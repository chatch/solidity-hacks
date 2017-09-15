var SendSha256Bytes = artifacts.require("./SendSha256Bytes.sol");

module.exports = function(deployer) {
  deployer.deploy(SendSha256Bytes);
};
