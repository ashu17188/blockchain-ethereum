// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0;

import "./Background.sol";

contract EntryPoint {
    address public backgroundAddress;

    constructor(address _background) {
        backgroundAddress = _background;
    }

    function getBackgroundAddress() public view returns (address) {
        return backgroundAddress;
    }

    function storeTwoValues(uint256 first, uint256 second) public {
        Background(backgroundAddress).storeValues(first);
        Background(backgroundAddress).storeValues(second);
    }

    function getNumberOfValues() public view returns (uint256) {
        return Background(backgroundAddress).getNumberOfValues();
    }
}
