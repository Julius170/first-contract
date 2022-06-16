// Get funds from users
// Withdraw Funds
// Set a minimum funding value in USD

// SPDX-Lisence-Identifier: MIT

pragma solidity ^0.8.8;
import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    
    address public immutable i_owner;
    constructor() {
        i_owner = msg.sender;
    }
    function fund() public payable {
        // want to he alble to set the minimum amount in USD
        // How to send ETH to this contract
        require (msg.value.getConversionRate() >= MINIMUM_USD , "Didn't send enough");
        funders.push(masg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        // Reverting 
        // to undo any action before, and send the remaining gas back 
    }

      
    
    function withdraw () public onlyOwner { 
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
        } 
        // reset the array 
        funders = new address[](0);
        
        
        // withdrawing funds (3 ways);
        
        // transfer {
            // msg.sender = address 
            // payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance);
        // // }
        // // send 
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");  
        // call  
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender is not owner!");
        _;

    }
}
