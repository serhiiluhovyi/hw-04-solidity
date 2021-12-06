// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract HW04Exchange {

    address owner= msg.sender;
    address aggregator_ETH_USD = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e;
    address aggregator_DAI_USD = 0x2bA49Aaa16E6afD2a993473cfB70Fa8559B523cF;
    IERC20 DAIToken = IERC20(0x5592EC0cfb4dbc12D3aB100b257153436a1f0FEa);
    IERC20 SerhiiToken = IERC20(0x26addf4F92b6b8933c98cE14b1bF7aB046e9E950);

    function buySerhiiTokens() public payable {
        ( , int256 ethPrice, , , ) = AggregatorV3Interface(aggregator_ETH_USD).latestRoundData();
        uint256 decimals = uint256(AggregatorV3Interface(aggregator_ETH_USD).decimals());
        uint256 ethPriceInUSD = uint256(ethPrice) / uint256(10 ** decimals);

        uint256 amountSLTKToBuy = (uint256(msg.value) * uint256(ethPriceInUSD)) / 10; //just to make SLTK2 price about 10 usd

        if(SerhiiToken.balanceOf(address(this)) < amountSLTKToBuy){
            (bool sent,) = msg.sender.call{value: msg.value}("Not enough SLTK tokens in this contract");
            return;
        }

        SerhiiToken.transfer(msg.sender, amountSLTKToBuy);
    }

    function buySerhiiTokensForDAI(uint256 amountDaiToPay) public {
        require(amountDaiToPay > 0, "Show me your money");

        ( , int256 daiPrice, , , ) = AggregatorV3Interface(aggregator_DAI_USD).latestRoundData();
        uint256 decimalsDai = uint256(AggregatorV3Interface(aggregator_DAI_USD).decimals());
        uint256 amountSLTKToBuy = (amountDaiToPay * uint256(daiPrice)) / 10 ** decimalsDai / 10; //just to make SLTK2 price about 10 usd

        if(SerhiiToken.balanceOf(address(this)) < amountSLTKToBuy){
            (bool sent,) = msg.sender.call("Not enough SLTK tokens in this contract");
            return;
        }

        uint256 allowance = DAIToken.allowance(msg.sender, address(this));
        require(allowance >= amountDaiToPay * 10 ** decimalsDai, "Check the token allowance please");

        DAIToken.transferFrom(msg.sender, address(this), amountDaiToPay * 10 ** 18);
        SerhiiToken.transfer(msg.sender, amountSLTKToBuy * 10 ** 18);
    }

}