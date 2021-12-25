// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
//variables
//data types
//custome data structure

    //State variables
    string public myString = "Hello, World!";
    bytes32 public myBytes32 = "Hello, World!";
    int public myInt = 1;
    uint public myUint = 1; //for unsigned int & this is uint256 sort form
    uint256 public myUint256 =1; // for unsigned big int
    uint8 public myUint8 = 1; // for unsigned small int
    //address public myAddress = 0xd825dd88f9332a703001544efe8e4d591e2bf6b7;

    struct MyStruct {
        uint myInt;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, World!");

    //Local variables
    function getValue() public pure returns(uint){
        uint value = 1;
        return value;
    }
}