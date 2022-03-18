const { assert } = require("chai");

const HelloWorldContract = artifacts.require("../contracts/HelloWorld.sol");

require("chai").use(require("chai-as-promised")).should();

contract("HelloWorld", (accounts) => {
  describe("HelloWorld Test suite", () => {
    it("has been deployed successfully", async () => {
      const helloWorld = await HelloWorldContract.deployed();
      assert(helloWorld, "contract was not deployed");
    });

    it("test if variables value is hello world", async () => {
      const helloWorld = await HelloWorldContract.deployed();
      const expected = "Hello, World!";
      const actual = await helloWorld.greet();
      assert.equal(actual, expected, "greeted with 'Hello, World!'");
    });
  });

  describe("owner()", () => {
    it("returns the address of the owner", async () => {
      const helloWorld = await HelloWorldContract.deployed();
      const owner = await helloWorld.owner();
      assert(owner, "the current owner");
    });

    it("matches the address that originally deployed the contract", async () => {
      const helloWorld = await HelloWorldContract.deployed();
      const owner = await helloWorld.owner();
      const expected = accounts[0];

      assert.equal(owner, expected, "matches address used to deploy contract");
    });
  });
});

contract("Greeter: update greeting", (accounts) => {
  describe("setGreeting(string)", () => {
    describe("when message is sent by the owner", () => {
      it("sets greeting to passed in string", async () => {
        const helloWorld = await HelloWorldContract.deployed();
        const expected = "Hi there!";
        await helloWorld.setGreeting(expected);
        const actual = await helloWorld.greet();
        assert.equal(actual, expected, "greeting was not updated");
      });
    });

    describe("when message is sent by another account", () => {
      it("does not set the greeting", async () => {
        const helloWorld = await HelloWorldContract.deployed();
        const expected = await helloWorld.greet();

        try {
          await helloWorld.setGreeting("Not the owner", { from: accounts[1] });
        } catch (err) {
          const errorMessage = "Ownable: caller is not owner";
          assert.equal(err.reason, errorMessage, "greeting should not update");
          return;
        }
        assert(false, "greeting should not update");
      });
    });
  });
});
