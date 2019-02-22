[![][ButlerImage]][website] 


# A crypto voting Dapp with vue.js,web3j and solidity.

This **Vote** system is a simple decentralized application built using **Ethereum** blockchain and **Vue.js and web3 ** for the front-end. The Dapp is very simple, after deployment you can initialize a set of candidates, let anyone vote for the target candidate and display the total votes received by each candidate. of cause, you can add new candidate if you are owner of contract.

The below is some snapshots that running on Ropsten test network. you also can deploy it on your private network, like Ganache,etc.

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/contract.PNG)

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/Summary.PNG)

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/vote-2.PNG)

![N|Solid](https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/vote-3.PNG)


Brief description
-------------------
The DApp allow users to register their name and status on the blockchain. The user's profile is associated with an account address (or wallet addres).

The owner of the profile is the only person who can modify his own data. This will give you a technical explanation of what it means when the user is in control of his own data (just like Facebook¡­ sarcasm!).
The **smart contract** is designed to give the user the **control of his own information** and not even the creator of the smart contract can control any data.

# Prerequisite
- NPM version 5.8.0
- TRUFFLE verson 4.1.5
- Ganache or your private network
- Metamask: not mandatory but better if you want to register more users

# Quick Installation
1) Download the project and decompress it into the folder **~/ethereum-vuejs-dapp** (or wherever you want).
2) Start ganache (or your private blockchain).
3) Open the terminal (if you are using Windows you **must use the Power Shell**) in the folder **~/ethereum-vuejs-dapp** and run the command:
```sh
$ truffle console --network ganache
```
4) If ganache is running you should be inside the truffle console; now run the following command in the truffle console:
```sh
> migrate --reset --compile-all
```
5) If the migration was successful, copy the content of the file **~/ethereum-vuejs-dapp/build/contracts/Users.json** into **~/ethereum-vuejs-dapp/app-users/src/assets/UsersContract.json**
6) Open another terminal in the folder **~/ethereum-vuejs-dapp/app-users** and run the command:
```sh
$ npm install
```
7) Once all the dependencies are installed run the command:
```sh
$ npm run dev
```
If everything went fine, the terminal will display a message similar to:
```sh
DONE  Compiled successfully in 5166ms           15:54:53

Your application is running here: http://localhost:8080
```
8) Open the browser, go to the URL shown by your terminal and play with the DApp!

**NOTE:** if you want to try to add more user profiles you have to install metamask in your browser, then import the accounts into metamask and finally change account on metamask in order to register a new user.


### Documentation:
-------------------
TODO




[ButlerImage]: https://github.com/weixuan2008/crypto-voting-master/blob/master/static/images/logo.png
[website]: https://github.com/weixuan2008/crypto-voting-master
