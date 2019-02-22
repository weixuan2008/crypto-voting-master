[![][ButlerImage]][website] 


# A crypto voting Dapp with vue.js,web3j and solidity.

This **Vote** system is a simple decentralized application built using **Ethereum** blockchain and **Vue.js and web3 ** for the front-end. The Dapp is very simple, after deployment you can initialize a set of candidates, let anyone vote for the target candidate and display the total votes received by each candidate. of cause, you can add new candidate if you are owner of contract.

The below is some snapshots that running on Ropsten test network. you also can deploy it on your private network, like Ganache,etc.

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/contract.PNG)

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/Summary.PNG)

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/vote-2.PNG)

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/vote-3.PNG)


# Prerequisite 
(Below is in my development environment)
- NPM version 6.4.1
- node verson 10.13.0
- TRUFFLE verson 5.0.3
- Ganache version 1.2.2(local test network)
- Ropsten (public test network)
- Metamask plugin in Chrome

# Quick Installation
1) Download the project and decompress it into the folder **~/crypto-voting-master** (or wherever you want). OR directly using git clone command get source code.
2) Start ganache (or your private blockchain).
3) Open the command terminal in the folder **~/crypto-voting-master** and run the command:
```
truffle.cmd compile
truffle.cmd migrate
```
4) If the migration was successful, copy the address of deployed contract to front-end javascript.
5) And run the command:
```
npm install
```
6) Once all the dependencies are installed run the command:
```
npm run dev
```
If everything went fine, the terminal will display a message similar to:
```
DONE  Compiled successfully in 5166ms           15:54:53

Your application is running here: http://localhost:8080
```
7) Open the browser, go to the URL shown by your terminal and play with the DApp!

**NOTE:** if you want to try to add more user profiles you have to install metamask in your browser, then import the accounts into metamask and finally change account on metamask in order to register a new user.


Notes: 
   1. For Ganache private network,the 10 default accounts with 100$ default balance will be generated after start
   2. For Ropsten network, you can register account and get free ETHER from faucet.
   3. In my env, Ropsten is very slow for functions calling, Ganache is my prefer test private network.
   5. You can deploy contract or test functions using remix(https://remix.ethereum.org/).



[ButlerImage]: https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/logo.png
[website]: https://github.com/weixuan2008/crypto-voting-master
