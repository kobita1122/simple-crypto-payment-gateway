// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title PaymentGateway
 * @dev A simple contract to accept native currency payments for specific services.
 */
contract PaymentGateway is Ownable {
    
    event PaymentReceived(address indexed payer, uint256 amount, uint256 orderId, uint256 timestamp);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    constructor() Ownable(msg.sender) {}

    /**
     * @dev Process a payment for a specific order.
     * @param orderId A unique identifier for the customer's order.
     */
    function payForService(uint256 orderId) public payable {
        require(msg.value > 0, "Payment must be greater than zero");
        
        emit PaymentReceived(msg.sender, msg.value, orderId, block.timestamp);
    }

    /**
     * @dev Allows the owner to withdraw all accumulated funds from the contract.
     */
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        
        (bool success, ) = payable(owner()).call{value: balance}("");
        require(success, "Transfer failed");
        
        emit FundsWithdrawn(owner(), balance);
    }

    /**
     * @dev Check the current balance of the gateway.
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
