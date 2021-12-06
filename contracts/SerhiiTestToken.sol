// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SerhiiTestToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Serhii Test Token", "SLTK2") {
        _mint(msg.sender, initialSupply * 10 ** 18);
    }
}