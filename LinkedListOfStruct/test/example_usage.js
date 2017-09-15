var ExampleUsage = artifacts.require("./ExampleUsage.sol")

contract('ExampleUsage', function(accounts) {

    it("should use library correctly", function(done) {
        const ADDRESS = "0x000000000000000000000000000000000000dead"
        const VALUE = 100
        const LIST_ID = 1

        let eu, entryId

        ExampleUsage.deployed().then(function(instance) {
            eu = instance
            return eu.addEntry(LIST_ID, ADDRESS, VALUE)
        }).then(function(result) {
            entryId = result.logs[0].args.entryId
            console.log(`ID ${entryId}`)
            return eu.getEntry.call(LIST_ID, entryId)
        }).then(function(result) {
            console.log(result)
            assert.equal(result[0], ADDRESS)
            assert.equal(result[1], VALUE)
            done()
        })
    })

})
