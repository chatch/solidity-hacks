const SendSha256Bytes = artifacts.require('./SendSha256Bytes.sol')

const crypto = require('crypto')

const txRetVal = txReceipt => txReceipt.receipt.logs[0].data

// Format required for a send of bytes through eth client:
//  - hex string representation
//  - prefixed with 0x
const bufToStr = b => '0x' + b.toString('hex')
const preimageBuf = crypto.randomBytes(32)
const preimageStr = bufToStr(preimageBuf)

const shaHashBuf = crypto.createHash('sha256').update(preimageBuf).digest()
const shaHashStr = bufToStr(shaHashBuf)

// console.log(preimageStr)
// console.log(shaHashStr)

contract('SendSha256Bytes', accounts => {
  it('should log and return the same sent bytes', done => {
    SendSha256Bytes.deployed()
      .then(c => c.sendHash(shaHashStr))
      .then(tx => assert.equal(txRetVal(tx), shaHashStr))
      .then(() => done())
      .catch(err => console.error(err))
  })

  it('should comapre hash with preimage', done => {
    SendSha256Bytes.deployed().then(c => {
      c
        .sendHash(shaHashStr)
        .then(tx => c.isMatch.call(preimageStr))
        .then(() => done())
        .catch(err => console.error(err))
    })
  })

  it('should log and return sha256 of bytes matching expected', done => {
    SendSha256Bytes.deployed()
      .then(c => c.sha256Me(preimageStr))
      .then(hash => assert.equal(hash, shaHashStr))
      .then(() => done())
      .catch(err => console.error(err))
  })
})
