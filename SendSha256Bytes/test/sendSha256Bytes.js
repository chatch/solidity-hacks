const SendSha256Bytes = artifacts.require('./SendSha256Bytes.sol')

const crypto = require('crypto')
const shaHashBuf = crypto.createHash('sha256').update('sh256 me up').digest()

// This is the format required for a send of bytes:
//  - hex string representation
//  - prefixed with 0x - without the 0x the string won
const shaHashStr = '0x' + shaHashBuf.toString('hex')

console.log(shaHashBuf)
console.log(shaHashStr)

contract('SendSha256Bytes', accounts => {
  it('should log and return the sent bytes', () => {
    SendSha256Bytes.deployed()
      .then(c => c.sendBytes.call(shaHashStr))
      .then(hash => assert.equal(hash, shaHashStr))
  })
})
