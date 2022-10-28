// Get funds from users
// Withdraw funds
// St a minimum funding value in USD

//--> Smart contracts can hold funds just like how wallets can

// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    uint256 public minimumUsd = 50*1e18;   //data.chain.link

    address[]public funders;
    mapping(address=>uint256)public addressToAmountFunded;  //This is used to record the funders and how much they have donated

    address public owner;
    constructor(){
        owner = msg.sender;
    }
    
    function fund() public payable{
        //Want to be able to set a min fund amount in USD
        //1. How do we send ETH to this contract
        require(msg.value.getConversionRate() >= minimumUsd , "Didn't send enough!"); // 1e18 = 1 eth
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]= msg.value;
    }
         


    function withdraw() public onlyOwner{
        // require(msg.sender == owner, "Sender is not owner");    use modifier instead
        for(uint256 funderIndex = 0; funderIndex < funders.length ; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder]=0;     //After withdrawl, reset the funder amount to zero
        }
        //reset the array
        funders = new address[](0);

        //withdraw the funds - 3 diff ways - transfer , send , call

        //1. Transfer
        /*
          msg.sender = address
          payable(msg.sender) = payable address
        */
        // payable(msg.sender).transfer(address(this).balance);

        //2. Send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess , "Send failed");


        //3. call (Recommended Method to withdraw)
        // (bool callSuccess , bytes memory dataReturned)=payable(msg.sender).call{value:address(this).balance}("");
        (bool callSuccess , )=payable(msg.sender).call{value:address(this).balance}("");

        require(callSuccess , "Call failed");

    }

    modifier onlyOwner {
        require(msg.sender == owner , "Sender is not owner!");
        _;
    }

}


// getConversionRate(msg.value) Old Style

/*
- Like Accounts, Ethereum Smart contract can also store etheruem and act as wallet.
*/