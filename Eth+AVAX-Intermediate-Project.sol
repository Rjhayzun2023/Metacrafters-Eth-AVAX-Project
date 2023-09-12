// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
Smart Contract Project
For this project, write a smart contract that implements the assert() require(), and revert() statements.
*/

contract rjToken {

    // public variables here
    string public name;
    string public abbrv;
    uint public totalSupply;

    //private variable here
    address private owner;

    //log
    event Mint(address indexed to, uint amount);
    event Burn(address indexed from, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    // mapping variable here
    mapping(address => uint) public balances;

    //consturctor
    constructor() {
        owner = msg.sender;
    }

    // modifier onlyOwner 
    modifier onlyOwner { 
        require (owner == msg.sender, "only the owner can access this function");
        _;
    }

    // set function 
    function set() public onlyOwner{
        name = "RJTOKEN";
        abbrv = "RJT";
        totalSupply = 0;
        balances[msg.sender] = 0;
    }

    // Mint function
    function mint(address _address1, uint _value) public onlyOwner {
        totalSupply += _value;
        balances[_address1] += _value;

        emit Mint(_address1, _value);
    }

    // Burn function
    function burn(address _address2, uint _value) public onlyOwner {
        if (balances[_address2] <= _value) {
            revert InsufficientBalance({balance: balances[_address2], withdrawAmount: _value});
        }else {
            totalSupply -= _value;
            balances[_address2] -= _value;
            emit Burn(_address2,_value);
        }
    }

    //Transfer function
    function transfer(address _address3, uint _value) public onlyOwner {
        assert(balances[msg.sender] > _value);
        balances[msg.sender] -= _value;
        balances[_address3] += _value;
        emit Transfer(msg.sender, _address3, _value);
    }

}