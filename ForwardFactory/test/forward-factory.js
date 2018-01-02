const ForwardToMe = artifacts.require('./ForwardToMe.sol')
const ForwardFactory = artifacts.require('./ForwardFactory.sol')

contract('ForwardFactory', () => {
  it('should log and return the same sent bytes', done => {
    Promise.all([ForwardFactory.new(), ForwardToMe.new()]).then(
      ([factory, instance]) => {
        factory.createForwarder(instance.address).then(factoryInst => {
          const factoryCreated = ForwardToMe.at(
            factoryInst.logs[0].args.forwarderAddress
          )
          // store a number in the factor created instance
          factoryCreated
            .storeStuff(2)
            .then(() =>
              // show that different values are stored in the 2 contracts
              Promise.all([instance.num.call(), factoryCreated.num.call()])
            )
            .then(([num1, num2]) => {
              assert.equal(num1, 0)
              assert.equal(num2, 2)

              // show a function with 2 return vars works
              return factoryCreated.return2Vars.call()
            })
            .then(([num1, num2]) => {
              assert.equal(num1, 1)
              assert.equal(num2, 2)
              done()
            })
        })
      }
    )
  })
})
