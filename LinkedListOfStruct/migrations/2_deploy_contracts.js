const LinkedListOfStruct = artifacts.require("./LinkedListOfStruct.sol");
const ExampleUsage = artifacts.require("./ExampleUsage.sol");

module.exports = function(deployer) {
  deployer.deploy(LinkedListOfStruct);
  deployer.link(LinkedListOfStruct, ExampleUsage);
  deployer.deploy(ExampleUsage);
};
