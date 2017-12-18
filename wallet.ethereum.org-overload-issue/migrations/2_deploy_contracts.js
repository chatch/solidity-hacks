var OverloadFunctions = artifacts.require('./OverloadFunctions.sol')
var OverloadFunctionsOle = artifacts.require('./OverloadFunctionsOle.sol')
var ViewsAndPures = artifacts.require('./ViewsAndPures.sol')

module.exports = function(deployer) {
  deployer
    .deploy(OverloadFunctions)
    .then(() => deployer.deploy(OverloadFunctionsOle))
    .then(() => deployer.deploy(ViewsAndPures))
}
