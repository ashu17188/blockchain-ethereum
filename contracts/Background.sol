// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0;

contract Background {
    uint256[] private values;

    function storeValues(uint256 value) public virtual {
        values.push(value);
    }

    function getValue(uint256 inital) public view returns (uint256) {
        return values[inital];
    }

    function getNumberOfValues() public view virtual returns (uint256) {
        return values.length;
    }
}
