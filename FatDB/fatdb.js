'use strict'

const fs = require('fs')
const path = require('path')
const Web3 = require('web3')
const geth = require('geth-private');

function deployContract(web3) {
  const classesJson = path.join(__dirname, 'build/classes.json')
  const contracts = JSON.parse(fs.readFileSync(classesJson), 'utf8')
  const dbABI = JSON.parse(contracts.FatDB.interface)
  const DB = web3.eth.contract(dbABI)
  return DB.new()
}

function fillDB(db) {
  console.log(db)
}


//
// start private network (geth) and start adding data
//
var inst = geth({
  genesisBlock: {
    difficulty: '0x0200'
  }
})

inst.start().then(() => {
  return inst.consoleExec('personal.unlockAccount(eth.accounts[0], 60 * 60)')
}).then(() => {
    return inst.consoleExec('miner.start()')
}).then(() => {
  const web3 = new Web3(new Web3.providers.HttpProvider())
  web3.eth.defaultAccount = web3.eth.accounts[0]

  const db = deployContract(web3)
  fillDb(db)

  inst.consoleExec('miner.stop()').then(() => {
    inst.stop().then(() => {
      console.info('geth shutdown')
    })
  })
}).catch((err) => {
  console.error(err)
  inst.stop().then(() => {
    process.exit(1)
  })
})
