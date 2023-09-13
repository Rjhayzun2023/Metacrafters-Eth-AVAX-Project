# Eth + Avax Proof Smart Contract

This is a Solidity smart contract named `FunctionsAndErrorHandling` that demonstrates various error-handling techniques using `require`, `revert`, and `assert` statements.

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

### Functions

- `testRequire(uint _value1)`

This function tests error handling with a `require` statement. It takes one parameter, `_value1`, and ensures that it is greater than zero. If the condition is not met, it will revert with an error message.

- `testRevert(uint _value1)`

This function tests error handling with both `revert` and `require` statements. It checks if `_value1` is an odd number and, if so, reverts with an "Odd number" error message.

- `testAssert(uint _value1, uint _value2)`

This function tests error handling with an `assert` statement. It checks if `_value1` is not divisible by `_value2`. If the condition is not satisfied, it will trigger an assertion error.

### Events

The contract emits the following events during execution:

- `ValueChecked1(bool boolean, uint value)`: Emits when the `testRequire` function is called. Logs whether the require condition was checked and the provided value.

- `ValueChecked2(bool isOdd, uint value)`: Emits when the `testRevert` function is called. Logs whether the value is odd and the provided value.

- `ValueAsserted(uint result)`: Emits when the `testAssert` function is called.
## Usage

### Install

1. Install [Node.js](https://nodejs.org)

   Download and install from the official site.

2. Install [Truffle](https://github.com/trufflesuite/truffle)

   ```bash
   npm install -g truffle
   ```


### Initialize

1. Initialize Truffle in your project folder

   ```bash
   truffle init
   ```

   After initialization, you will find two folders called `contracts` and `migrations`. Contracts go in the `contracts` folder while contract deployment settings go in `migrations`.

2. The "FunctionAndErrorHandling" contract


   ```solidity
      // SPDX-License-Identifier: MIT
      // Compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
      pragma solidity ^0.8.17;
      
      contract FunctionsAndErrorHandling {

    event ValueChecked1(bool boolean, uint value);
    event ValueChecked2(bool isOdd, uint value);
    event ValueAsserted(uint result);

    // Function for testing error handling with a require statement
    function testRequire(uint _value1) public  returns (uint) {
        require(_value1 > 0, "Value must be greater than 0");
        emit ValueChecked1(true, _value1); // Log that the require condition was checked
        return _value1;
    }

    // Function for testing error handling with revert and require statements
    function testRevert(uint _value1) public  {
        if (_value1 % 2 != 0) {
            emit ValueChecked2(true, _value1); // Log that the value is odd
            revert("Odd number");
        }
    }

    // Function for testing error handling with assert statement
    function testAssert(uint _value1, uint _value2) public  returns (uint) {
        assert(_value1 % _value2 != 0);
        emit ValueAsserted(_value1 / _value2); // Log the result of the assert
        return _value1 / _value2;
    }
}

   ```

3. Prepare the migration

   "2_deploy_migration.js" in `migrations` contains the following code:

   ```javascript
   var Project1 = artifacts.require("FunctionAndErrorHandling");
   module.exports = function(deployer) {
     deployer.deploy(Project1);
   }
   ```

4. Start Truffle console in development mode

   ```bash
   truffle develop
   ```

   In the Truffle console, execute

   ```bash
   compile
   migrate
   ```
   If you want to remigrate existing contracts, run `migrate --reset` instead of simply `migrate`.

5. Test your contract

   In the interactive Truffle console, run the following commands:

   ```javascript
   let instance = await FunctionAndErrorHandling.deployed()
   instance.testRequire(<parameter>)
   instance.testRevert(<parameter>)
   instance.testAssert(<parameter>,<parameter>)
   ```
## Authors

Metacrafter Randel Jason B. Espiritu

## License

This contract is released under the MIT License. You can find the license information in the contract source code.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
