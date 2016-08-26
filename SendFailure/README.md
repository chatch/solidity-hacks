Calling sendToBadAddress on Morden raised these events:

_bal: 10000000000000
_bal: 14985300011000000000
_bal: 9999999999999
_bal: 14985300011000000001

_bal at 1st and 3rd are as expected. This shows the money leaving the sender.

0xdead returns a large balance that does increments by 1 after the send.
0xdead has an entry on etherscan (https://testnet.etherscan.io/address/0x000000000000000000000000000000000000dead) which shows other users have sent ether to it.

So send to this account succeeds.
