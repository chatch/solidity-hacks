const ExtCodeHashCheck = artifacts.require("ExtCodeHashCheck")
const WhatAmI = artifacts.require("WhatAmI")
const Migrations = artifacts.require("Migrations")
const WhatAmIJSON = require('../build/contracts/WhatAmI.json')

contract('ExtCodeHashCheck', function (accounts) {

  const whatAmIContractCodeHash = web3.utils.keccak256(WhatAmIJSON.deployedBytecode)
  // console.log(`bytecode hash: ${whatAmIContractCodeHash}`)

  const assertIsAWhatAmI = async (checkContract, addr, expectedBool) =>
    assert.equal(
      await checkContract.isAWhatAmI.call(addr),
      expectedBool,
      `instance address ${addr} must not match ${whatAmIContractCodeHash}`
    )

  let check

  before(async () => {
    check = await ExtCodeHashCheck.deployed(whatAmIContractCodeHash)
  })

  describe("isAWhatAmI", () => {

    it(`address not on blockchain should return false`, async () => {
      await assertIsAWhatAmI(
        check,
        '0x00D6Cc1BA9cf89BD2e58009741f4F7325BAdc0ED',
        false
      )
    })

    it(`address for non contract account should return false`, async () =>
      await assertIsAWhatAmI(check, accounts[0], false)
    )

    it(`address for other contract should return false`, async () => {
      const migrations = await Migrations.new()
      await assertIsAWhatAmI(check, migrations.address, false)
    })

    it(`address for a WhatAmI instance should return true`, async () => {
      const whatAmI = await WhatAmI.new()
      await assertIsAWhatAmI(check, whatAmI.address, true)
    })

  })

  it(`whatAmIInstanceCodeHash`, async () => {
    const whatAmI = await WhatAmI.new()
    assert.equal(
      await check.whatAmIInstanceCodeHash.call(whatAmI.address),
      whatAmIContractCodeHash
    )
  })

  describe(`callIfWhatAmI`, () => {
    it(`calls WhatAmI function and gets result`, async () => {
      const whatAmI = await WhatAmI.new()
      assert.equal(
        await check.callIfWhatAmI.call(whatAmI.address),
        "I'm a WhatAmI contract",
      )
    })

    it(`retruns empty string when addr is not a WhatAmI contract`, async () => {
      assert.equal(
        await check.callIfWhatAmI.call(accounts[0]),
        "",
      )
    })
  })

})
