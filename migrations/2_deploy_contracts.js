var Users = artifacts.require("./Users.sol");
var Person = artifacts.require("./Person.sol");
var election = artifacts.require("./Election.sol");



module.exports = function(deployer) {
  deployer.deploy(Users);
  deployer.deploy(Person);
  deployer.deploy(election);
};
