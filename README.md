# Simple Crypto Payment Gateway

This repository contains a secure, flat-structured smart contract designed for merchants and developers to accept cryptocurrency payments directly on the blockchain. It includes payment logging and withdrawal logic for the contract owner.

## Features
* **Payment Tracking:** Emits events for every transaction, making it easy for front-end apps to confirm payments.
* **Service ID Integration:** Allows passing a unique ID (like an order number) with each payment.
* **Security:** Built with OpenZeppelin's `Ownable` to ensure only the merchant can withdraw funds.

## Getting Started
1. Deploy `PaymentGateway.sol` to your preferred network (Ethereum, Polygon, etc.).
2. Use the `payForService` function from your website, passing the amount and an Order ID.
3. Monitor the `PaymentReceived` event to fulfill orders.
4. Use `withdraw()` to transfer collected funds to your wallet.

## License
MIT
