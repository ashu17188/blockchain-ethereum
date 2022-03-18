const EntryPoint = artifacts.require("../contracts/EntryPoint.sol");

require("chai").use(require("chai-as-promised")).should();
contract("EntryPoint", (account) => {
  describe("Storing values", () => {
    it("stores correctly", async () => {
      const entryPoint = await EntryPoint.deployed();
      let numberOfValues = await entryPoint.getNumberOfValues();
      numberOfValues.toString().should.equal("0");

      await entryPoint.storeTwoValues(2, 4);
      numberOfValues = await entryPoint.getNumberOfValues();
      numberOfValues.toString().should.equal("2");
    });
  });
});
