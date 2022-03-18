const { default: Web3 } = require("web3");

const Background = artifacts.require("Background");
const EntryPoint = artifacts.require("EntryPoint");
const HelloWorld = artifacts.require("HelloWorld");

module.exports = async function (deployer) {
  const account = await web3.eth.getAccounts();
  let deployedBackground = await deployer.deploy(Background);
  await deployer.deploy(EntryPoint, deployedBackground.address);
};
