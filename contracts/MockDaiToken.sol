// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockDaiToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Mock Dai Token", "DAI") {
        _mint(msg.sender, initialSupply * 10 ** 18);
    }
}