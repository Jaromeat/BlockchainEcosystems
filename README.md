# Exploring Blockchain Ecosystems

## Abstract

We explored Ethereum, Bitcoin, and Tezos as smart contract ecosystems to determine their strengths and weaknesses based on popularity, features, development tools, and future. We then explain our experience designing and developing a contract for each ecosystem. Then we looked at two up and coming ecosystems to determine where the future of cryptocurrency is headed. We discovered that blockchain ecosystems are moving away from proof of work towards proof of stake and other alternatives to ensure blockchain ecosystems remain scalable, fast, and secure.

## Keywords
 Ethereum, Bitcoin, Tezos, Cardano, Diem (Libra), Proof of Work, Proof of Stake, Proof of Authority, Proof of Activity, Blockchain Ecosystems, Smart Contracts

## Getting Started
### Ethereum
1. Smart Contracts written in Solidity
2. IDE and Testing environment known as Remix
3. Try it here : https://remix.ethereum.org/

### Bitcoin
1. Smart Contract Scripts written in Min.sc
2. Try it here : https://min.sc/

### Tezos
1. Smart Contracts written in Python
2. IDE and Testing environment known as Smartpy
3. Try it here : https://smartpy.io/

## Introduction
   Blockchain technology was invented for digital currency. It allows two or more users to securely transfer money to one another over servers. One of the most important aspects of blockchain is that there isn’t an online bank or banks in charge of money. Money can be transferred from anywhere at any time. All that is required is an internet connection. This concept is referred to as decentralization. Freedom from a centralized provider spurred the birth of Bitcoin, a digital currency reliant entirely on the merits of blockchain. However, Bitcoin is not alone. Currencies like Ethereum managed to stay ahead of the competition with the introduction of smart contracts, a framework for developing apps that run entirely on the blockchain, run by the blockchain miners at a cost. The introduction of smart contracts has led many cryptocurrencies to blossom into blockchain ecosystems, complex networks of interwoven contracts and decentralized applications (Dapps). The smart contract has become an important tool in expanding the use of cryptocurrencies, but not all ecosystems are created equal. Which ecosystem should a developer choose when designing a Dapp? We plan to define the benefits and downfalls of blockchain ecosystems of widely varying structure to inform development decisions and predict the future of blockchain ecosystems.
We have researched 5 cryptocurrencies: Ethereum, Bitcoin, Tezos, Cardano, and Diem (Libra) for comparison. For those that have fully implemented smart contracts, we designed a contract to facilitate the functionality of a trade board. The requirements of the trade board are listed:

* The seller must be able to add a trade request to the board
* The buyer must be able to see requests and make offers
* Secure transfer of funds must occur between the buyer and seller

   Following these requirements we designed and developed 3 smart contracts portraying the differences between smart contract scripts, smart contracts on a proof of work system, and smart contracts on a proof of stake system. To begin, let us explain consensus algorithms.
Blockchain ecosystems rely on the integrity of blockchain to build security and credibility. Changes to the blockchain can have sweeping effects on the overarching cryptocurrency and smart contract system. The most dramatic variation in blockchain makeup comes in the form of the consensus protocol. A consensus protocol ensures that the blockchain remains secure by requiring proof that a new block is valid, that the miner is allowed to add it to the chain, and that the network agrees on the make-up of the chain. Following is a description of several popular consensus protocols including their strengths and weaknesses starting with a naive solution, proof of authority.

## Contributors

* Jamie Kerr
* Joe Cucuzza

