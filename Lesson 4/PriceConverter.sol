// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainliink/contract/src/v0.8/interfaces/AggregatorV3Interface.sol"
library PriceConverter{
    function getPrice() public {
        // ABI
        // Address 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xAb983b6216Ae3Fd41Bf71e7ac83aADD224329421);
        return uint256 (price * 1e10);  
    }



    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xAb983b6216Ae3Fd41Bf71e7ac83aADD224329421  )
        return priceFeed.version();
    }


    function getConversionRate(uint256 etHAmount) public view return(uint256) {
        uint256 etthPrice = getPrice();
        
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}