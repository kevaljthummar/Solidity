// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    //Ether - pay smart contract

    //Enums
    enum Statuses {Vacant, Occupied}
    Statuses currentStatus;

    //Events
    event Occupy(address _occupant, uint _value);

    address payable public Owner;

    constructor(){
        Owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    //Modifiers
    modifier onlyWhileVacant {
        //Check Statuses
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _; // this will execute the function body
    }

    modifier cost(uint _amount){
        //Check Price
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }

    //receive() external payable {…} (without the function keyword). 
    //It executes on calls to the contract with no data ( calldata ), 
    //e.g. calls made via send() or transfer()
    receive() external payable onlyWhileVacant cost(2 ether) {
        currentStatus = Statuses.Occupied;
        Owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}