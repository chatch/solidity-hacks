const ForwardToMe = artifacts.require('./ForwardToMe.sol')
const ForwardFactory = artifacts.require('./ForwardFactory.sol')

contract('ForwardFactory', () => {
  const constructArg = 10
  const factoryCreatedInstanceNum = 2

  it('should log and return the same sent bytes', done => {
    Promise.all([ForwardFactory.new(), ForwardToMe.new(constructArg)]).then(
      ([factory, instance]) => {
        factory.createForwarder(instance.address).then(factoryInst => {
          const factoryCreated = ForwardToMe.at(
            factoryInst.logs[0].args.forwarderAddress
          )
          // store a number in the factor created instance
          factoryCreated
            .storeStuff(factoryCreatedInstanceNum)
            .then(() =>
              // show that different values are stored in the 2 contracts
              Promise.all([instance.num.call(), factoryCreated.num.call()])
            )
            .then(([num1, num2]) => {
              assert.equal(num1, 0) // was not set
              assert.equal(num2, factoryCreatedInstanceNum)

              // show a function with 2 return vars works
              return factoryCreated.return2Vars.call()
            })
            .then(([num1, num2]) => {
              // both these hard coded return
              assert.equal(num1, 1)
              assert.equal(num2, 2)

              // check the constructorArgValue value
              return Promise.all([
                instance.constructorArgValue.call(),
                factoryCreated.constructorArgValue.call(),
              ])
            })
            .then(([num1, num2]) => {
              assert.equal(num1, constructArg)
              assert.equal(num2, 0) // not stored ...
              done()
            })
        })
      }
    )
  })
})
