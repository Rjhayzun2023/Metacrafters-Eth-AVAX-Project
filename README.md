# RJToken Smart Contract

This is a simple Solidity smart contract called **RJTOKEN** that implements functions and error functionalities for creating and managing a custom token. The contract includes features like minting new tokens, burning existing tokens and lastly transfering tokens.

## Table of Contents

- [Requirements](#requirements)
- [Contract Overview](#contract-overview)
- [Usage](#usage)
- [Authors](#authors)
- [License](#license)

## Requirements

Before delving into the details of this smart contract, let's review the requirements:

For this project, write a smart contract that implements the require(), assert() and revert() statements.

Upload your solution to GitHub and share the link with us along with a quick code walk-through as explained below.

## Contract Overview

This Solidity smart contract, named **rjToken**, fulfills the requirements outlined above. Here's an overview of the contract:

- Public variables:
  - `name`: A string representing the name of the token.
  - `abbrv`: A string representing the abbreviation of the token.
  - `totalSupply`: An unsigned integer representing the total supply of the token.

- Events:
  - `Mint(address indexed to, uint amount)`: An event emitted when tokens are minted.
  - `Burn(address indexed from, uint amount)`: An event emitted when tokens are burned.
  - `Transfer(address indexed from, address indexed to, uint amount)`: An event emitted when tokens are transferred.

- Custom error:
  - `InsufficientBalance(uint balance, uint withdrawAmount)`: A custom error used for handling cases where an account has an insufficient balance.

- Mapping:
  - `balances`: A mapping that associates Ethereum addresses with their token balances.

- Constructor:
  - The constructor initializes the contract with the owner's address.

- Modifier
  - uses the `require` statement to check if the set owner was the imediate.

- **set** function:
  - This function allows the owner to set the name, abbreviation, total supply, and the owner's balance of the token. `For code demo only`

- **mint** function:
  - This function allows the owner to mint new tokens and assign them to a specified address.

- **burn** function:
  - This function allows the owner to burn tokens from a specified address. It includes conditional checks to ensure that the specified address has a balance greater than or equal to the amount to be burned. If the conditional statement is true it will call the statement `revert`, which will display an error message `InsufficientBalance`.

- **transfer** function:
  - This function allows the owner to transfer tokens from their own address to another address. It uses the `assert` statement to ensure that the sender has a sufficient balance before transferring.

## Usage

Step 1: Open Remix

Visit https://remix.ethereum.org/ in your web browser to access the Remix Ethereum IDE.

Step 2: Create a New File

In the Remix IDE, you'll see the "File Explorers" panel on the left side. Right-click on the "contracts" folder and select "New File." Name the file "rjToken.sol."

Step 3: Copy and Paste the Smart Contract Code

Copy the entire "rjToken" smart contract code and paste it into the "rjToken.sol" file in Remix.

Step 4: Compile the Smart Contract

In the Remix IDE, navigate to the "Solidity Compiler" tab on the left sidebar.
Select the "rjToken.sol" file from the file explorer.
Choose the appropriate compiler version. In this case, choose "0.8.18," which is specified in your contract.
Click the "Compile rjToken.sol" button. The contract should compile without errors.
Step 5: Deploy the Smart Contract

Navigate to the "Deploy & Run Transactions" tab on the left sidebar.
In the "Environment" section, select "JavaScript VM" to deploy the contract on a simulated blockchain provided by Remix.
In the "Deploy" section, select the "rjToken" contract from the dropdown.
Click the "Deploy" button. This will deploy the "rjToken" contract to the simulated blockchain.

Step 6: Interact with the Contract

Now that the contract is deployed, you can interact with it using Remix's interface.

You can set token information by calling the "set" function. Click the "set" function, enter the desired name and abbreviation for your token, and click "transact." This will set the name and abbreviation for your token.

You can mint new tokens using the "mint" function. Provide an address and the number of tokens you want to mint, then click "transact."

You can burn tokens using the "burn" function. Provide an address and the number of tokens you want to burn, then click "transact."

You can transfer tokens from one address to another using the "transfer" function. Provide the recipient's address and the number of tokens to transfer, then click "transact."

Step 7: Test and Explore

You can continue testing and exploring the functionalities of the "rjToken" smart contract in Remix.

## Authors

Metacrafter Randel Jason B. Espiritu

## License

This contract is released under the MIT License. You can find the license information in the contract source code.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
