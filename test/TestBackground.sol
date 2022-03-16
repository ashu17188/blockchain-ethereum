// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Background.sol";

contract TestBackground {
    Background public background;

    function beforeEach() public {
        background = new Background();
    }

    //Test if Contract stores values correctly or not
    function testIsStoreValue() public {
        uint256 value = 5;
        background.storeValues(value);
        uint256 result = background.getValue(0);
        Assert.equal(result, value, "It should store value");
    }

    //Test if contract return the correct number of values;
    function testItGetsACorrectValue() public {
        background.storeValues(100);
        uint256 result = background.getNumberOfValues();
        Assert.equal(result, 1, "It should increase the size");
    }

    //Test if contract stores multiple values
    function testItStoresMultipleValues() public {
        for (uint256 i = 0; i < 10; i++) {
            uint256 value = i;
            background.storeValues(i);
            uint256 result = background.getValue(i);
            Assert.equal(
                result,
                value,
                "It should store the values correctly."
            );
        }
    }
}
