// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'

import Web3 from 'web3'
import router from './router'

import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
Vue.use(Buefy, {defaultIconPack: 'fas'})

Vue.config.productionTip = false

window.addEventListener('load', function () {
  if (typeof web3 !== 'undefined') {
    console.log('Web3 injected browser: OK.')
    window.web3 = new Web3(window.web3.currentProvider)
    var tmp = window.web3.currentProvider.isMetaMask
    if (tmp === true) {
      console.log('true')
    } else {
      console.log('false')
    }
    console.log(tmp)
    console.log(window.web3)

    window.web3.eth.net.getId((err, netId) => {
      switch (netId) {
        case '1':
          console.log('This is mainnet')
          break
        case '2':
          console.log('This is the deprecated Morden test network.')
          break
        case '3':
          console.log('This is the ropsten test network.')
          break
        case '4':
          console.log('This is the Rinkeby test network.')
          break
        case '42':
          console.log('This is the Kovan test network.')
          break
        default:
          console.log('This is an unknown network. id is: ' + netId)
      }
      if (!err) {
        console.log('ok')
      } else {
        console.log('No')
      }
    })
  } else {
    console.log('Web3 injected browser: Fail. You should consider trying MetaMask.')
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    window.web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))
  }

  /* eslint-disable no-new */
  new Vue({
    el: '#app',
    router,
    template: '<App/>',
    components: {
      App
    }
  })
})

