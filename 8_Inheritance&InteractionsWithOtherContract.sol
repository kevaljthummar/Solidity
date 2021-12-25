// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public Owner;

    constructor() {
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == Owner, "must be owner");
        _;
    }
}

contract SecretVault {
    string Secret;

    constructor(string memory _secret) {        
        Secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return Secret;
    }
}

contract MyContract is Ownable{
    //Inheritance
    //Factories
    //working with other smart contracts //smart contract interactions
    address secretVault;    

    constructor(string memory _secret) {        
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns(string memory){
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
}