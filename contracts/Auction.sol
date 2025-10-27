// contracts/Auction.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Auction {
    address public seller;
    uint256 public highestBid;
    address public highestBidder;

    constructor() { seller = msg.sender; }

    function bid() external payable {
        require(msg.value > highestBid, "low");
        highestBid = msg.value;
        highestBidder = msg.sender;
    }

    function close() external {
        require(msg.sender == seller);
        payable(seller).transfer(highestBid);
    }
}
