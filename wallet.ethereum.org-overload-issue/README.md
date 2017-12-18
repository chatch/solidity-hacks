## Demonstrate overload function issue

* OverloadFunctions.sol - overload functions with 'pure'
* OverloadFunctionsOle.sol - overload functions with 'constant'
* ViewsAndPures.sol - shows no issue handling functions with keywords pure / view

Watch contract on the above two contracts OverloadFunctions and OverloadFunctionsOle and the wallet UI will (https://wallet.ethereum,org) fail to render the functions in the contract view.

Error is "Invalid number of arguments to Solidity function.".

```
Exception from Tracker recompute function:
397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:3 Error: Invalid number of arguments to Solidity function
    at Object.InvalidNumberOfSolidityArgs (inpage.js:14024)
    at c.validateArgs (inpage.js:14024)
    at c.toPayload (inpage.js:14024)
    at c.call (inpage.js:14024)
    at c.execute (inpage.js:14024)
    at f.View.<anonymous> (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:406)
    at 397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89
    at Function.e._withTemplateInstanceFunc (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:91)
    at 397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89
    at Object.f._withCurrentView (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89)
    at c (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89)
    at o.Computation._compute (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:23)
    at new o.Computation (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:23)
    at Object.o.autorun (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:23)
    at f.View.autorun (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89)
    at f.TemplateInstance.autorun (397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:91)
397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:3 Exception in template helper: Error: Must be attached
    at f._DOMRange.t.firstNode (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:4918)
    at f.View.i.templateInstance (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:91:2830)
    at Function.e.instance (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:91:5751)
    at Object.<anonymous> (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:140:1966)
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:30879
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:16577
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:31512
    at Function.e._withTemplateInstanceFunc (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:91:5222)
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:31419
    at Object.s.dot (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:93:2441)
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:282:5090
    at f.View.<anonymous> (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:28174)
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:18555
    at Function.e._withTemplateInstanceFunc (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:91:5222)
    at https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:18507
    at Object.f._withCurrentView (https://wallet.ethereum.org/397aa44131c4acb3a7f7dc63f99af25ed9a1ebaa.js:89:22623)
```
