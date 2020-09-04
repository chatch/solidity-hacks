const { expect } = require("chai")

describe("CreateSaltedFactory", function () {
  it("Should create contract with predicted Create2 address", async function () {

    const Factory = await ethers.getContractFactory("CreateSaltedFactory")
    const CreateMe = await ethers.getContractFactory("CreateMe")

    const factory = await Factory.deploy()
    await factory.deployed()

    const saltHash = ethers.utils.id('something')
    const argUint = 1

    // Initcode hash  - has of contract to creates bytecode plus any contructor arguments packed together
    const initCodeHash = ethers.utils.solidityKeccak256(
      ["bytes", "uint256"],
      [CreateMe.bytecode, argUint]
    )

    // predict address

    // const someComboSalt = utils.solidityKeccak256(["uint256"], [argUint])
    const predictedAddr = ethers.utils.getCreate2Address(
      factory.address,
      saltHash,
      initCodeHash
    )

    // ethers TransactionResponse: https://docs.ethers.io/v5/api/providers/types/#providers-TransactionResponse
    const txResponse = await factory.createMeSalted(
      saltHash,
      argUint
    )
    // console.log(txResponse)

    // ethers TxReceipt: https://docs.ethers.io/v5/api/providers/types/#providers-TransactionReceipt
    const txReceipt = await txResponse.wait()
    // console.log(txReceipt)
    const createdAddr = txReceipt.events[0].args[0]

    expect(createdAddr).to.equal(predictedAddr)
  })
})
