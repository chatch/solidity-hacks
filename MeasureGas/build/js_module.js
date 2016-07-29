'use strict';

// For geth
if (typeof dapple === 'undefined') {
  var dapple = {};
}

if (typeof web3 === 'undefined' && typeof Web3 === 'undefined') {
  var Web3 = require('web3');
}

dapple['MeasureGas'] = (function builder () {
  var environments = {
      'default': 'test',
      'test': {
        'confirmationBlocks': 0,
        'objects': {
          'spendGas': {
            'class': 'SpendGas',
            'address': '0x5eb20e506b7de310733bcd7898d77086316793d4'
          }
        }
      }
    };

  function ContractWrapper (headers, _web3) {
    if (!_web3) {
      throw new Error('Must supply a Web3 connection!');
    }

    this.headers = headers;
    this._class = _web3.eth.contract(headers.interface);
  }

  ContractWrapper.prototype.deploy = function () {
    var args = new Array(arguments);
    args[args.length - 1].data = this.headers.bytecode;
    return this._class.new.apply(this._class, args);
  };

  var passthroughs = ['at', 'new'];
  for (var i = 0; i < passthroughs.length; i += 1) {
    ContractWrapper.prototype[passthroughs[i]] = (function (passthrough) {
      return function () {
        return this._class[passthrough].apply(this._class, arguments);
      };
    })(passthroughs[i]);
  }

  function constructor (_web3, env) {
    if (!env) {
      env = 'test';
    }
    while (typeof env !== 'object') {
      if (!(env in environments)) {
        throw new Error('Cannot resolve environment name: ' + env);
      }
      env = environments[env];
    }

    if (typeof _web3 === 'undefined') {
      if (!env.rpcURL) {
        throw new Error('Need either a Web3 instance or an RPC URL!');
      }
      _web3 = new Web3(new Web3.providers.HttpProvider(env.rpcURL));
    }

    this.headers = {
      'SpendGas': {
        'interface': [
          {
            'constant': true,
            'inputs': [
              {
                'name': '',
                'type': 'address'
              }
            ],
            'name': 'aMapOfAddressToUint',
            'outputs': [
              {
                'name': '',
                'type': 'uint256'
              }
            ],
            'type': 'function'
          },
          {
            'constant': true,
            'inputs': [],
            'name': 'aUint256',
            'outputs': [
              {
                'name': '',
                'type': 'uint256'
              }
            ],
            'type': 'function'
          },
          {
            'constant': false,
            'inputs': [],
            'name': 'withAlwaysThrow',
            'outputs': [],
            'type': 'function'
          },
          {
            'constant': true,
            'inputs': [],
            'name': 'aUint32',
            'outputs': [
              {
                'name': '',
                'type': 'uint32'
              }
            ],
            'type': 'function'
          },
          {
            'constant': true,
            'inputs': [
              {
                'name': '',
                'type': 'uint256'
              }
            ],
            'name': 'anArrayOfAddress',
            'outputs': [
              {
                'name': '',
                'type': 'address'
              }
            ],
            'type': 'function'
          },
          {
            'constant': false,
            'inputs': [],
            'name': 'incrementUint32',
            'outputs': [],
            'type': 'function'
          },
          {
            'constant': false,
            'inputs': [],
            'name': 'incrementUint256',
            'outputs': [],
            'type': 'function'
          },
          {
            'inputs': [],
            'type': 'constructor'
          }
        ],
        'bytecode': '60606040525b5b610245806100146000396000f36060604052361561007f576000357c010000000000000000000000000000000000000000000000000000000090048063227b07b01461008157806337a92d02146100ad57806338fbe296146100d05780633ab9efad146100df578063969d724514610108578063aac3155b1461014a578063d1f44279146101595761007f565b005b6100976004808035906020019091905050610168565b6040518082815260200191505060405180910390f35b6100ba6004805050610183565b6040518082815260200191505060405180910390f35b6100dd600480505061018c565b005b6100ec600480505061019e565b604051808263ffffffff16815260200191505060405180910390f35b61011e60048080359060200190919050506101b4565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b61015760048050506101f6565b005b610166600480505061022e565b005b60036000506020528060005260406000206000915090505481565b60016000505481565b60011561019857610002565b6002505b565b600060009054906101000a900463ffffffff1681565b600260005081815481101561000257906000526020600020900160005b9150909054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b6000600081819054906101000a900463ffffffff168092919060010191906101000a81548163ffffffff02191690830217905550505b565b60016000818150548092919060010191905055505b56'
      }
    };

    this.classes = {};
    for (var key in this.headers) {
      this.classes[key] = new ContractWrapper(this.headers[key], _web3);
    }

    this.objects = {};
    for (var i in env.objects) {
      var obj = env.objects[i];
      this.objects[i] = this.classes[obj['class']].at(obj.address);
    }
  }

  return {
    class: constructor,
    environments: environments
  };
})();

if (typeof module !== 'undefined' && module.exports) {
  module.exports = dapple['MeasureGas'];
}
