const { default: Web3 } = require("web3");

const HelloWorld = artifacts.require("HelloWorld");

module.exports = async function (deployer) {
  deployer.deploy(HelloWorld);
};
