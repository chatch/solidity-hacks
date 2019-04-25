const WhatAmI = artifacts.require("WhatAmI")
const ExtCodeHashCheck = artifacts.require("ExtCodeHashCheck")

const WhatAmIJSON = require('../build/contracts/WhatAmI.json')

// console.log(WhatAmIJSON)

module.exports = function (deployer) {
  deployer.deploy(WhatAmI)

  const codeHash = web3.utils.keccak256(WhatAmIJSON.deployedBytecode)
  deployer.deploy(ExtCodeHashCheck, codeHash)
}
