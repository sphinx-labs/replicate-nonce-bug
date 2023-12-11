// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library MyLib {
    function add(uint256 a, uint256 b) external pure returns (uint256) {
        return a + b;
    }
}

contract Counter {
    using MyLib for uint;

    uint256 public number;

    constructor (uint _number) {
      number = _number;
    }

    function increment() public {
      number = number.add(number);
    }
}
