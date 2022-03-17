pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Background.sol";
import "../contracts/EntryPoint.sol";

contract TestIntegrationEntryPoint {
    BackgroundTest public backgroundTest;
    EntryPoint public entryPoint;

    function beforeEach() public {
        backgroundTest = new BackgroundTest();
        entryPoint = new EntryPoint(address(backgroundTest));
    }

    function testItStoresTwoValues() public {
        uint256 value1 = 10;
        uint256 value2 = 20;

        entryPoint.storeTwoValues(value1, value2);
        uint256 result1 = backgroundTest.values(0);
        uint256 result2 = backgroundTest.values(1);

        Assert.equal(result1, value1, "Value1 is correctly stored.");
        Assert.equal(result2, value2, "Value2 is correctly stored.");
    }
}

contract BackgroundTest is Background {
    uint256[] public values;

    function storeValues(uint256 value) public override {
        values.push(value);
    }

    // function getNumberOfValues() public view override returns (uint256) {
    //     return 100;
    // }
}
