'use strict'

const fs = require('fs')
const yaml = require('read-yaml')

const buildPath = './build'
const contractDefs = JSON.parse(fs.readFileSync(buildPath + '/classes.json', 'utf8'))
const spendABI = JSON.parse(contractDefs.SpendGas.interface)

const contracts = yaml.sync('dappfile').environments.test.objects
console.log(contracts.spendGas.address)

const Web3 = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider())
const eth = web3.eth
eth.defaultAccount = eth.accounts[0]


const SpendGas = eth.contract(spendABI)
const spend = SpendGas.at(contracts.spendGas.address)

// override sendTransaction with a gas logging wrapper
let originalSendTx = spend.incrementUint32.sendTransaction
let gasLoggingSendTx = function(payload, callback) {
//    let estimate = this.estimateGas(payload, callback)
//  console.log('estimate: ' + estimate)
console.log('\n\ninside wrapper\n\n')

    let tx = this.originalSendTx(payload, callback)
    if (!tx)
        return

    return tx
    //
    // let receipt = this.getTransactionReceipt(tx)
    // console.log('tx gas: ' + receipt.gasUsed)
}
spend.incrementUint32.sendTransaction = console.log
// gasLoggingSendTx.bind(spend)

let gasTotal = 0


spend.incrementUint32(logGas)
// spend.incrementUint256(logGas)

function logGas(error, tx) {
    if (error)
        console.log('Error: ' + error)
    let receipt = web3.eth.getTransactionReceipt(tx)
    console.log('tx gas: ' + receipt.gasUsed)
    // console.log('cumulative gas: ' + receipt.cumulativeGasUsed)
    gasTotal += receipt.gasUsed
}
