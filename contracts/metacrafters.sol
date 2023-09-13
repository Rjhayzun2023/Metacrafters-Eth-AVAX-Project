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
