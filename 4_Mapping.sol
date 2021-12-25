// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //Mapping
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    //mapping(key => mapping(key2 => value)) public myMapping; //complex mapping structure
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "A";
        names[2] = "B";
        names[3] = "C";
    }

    function addBooks(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBooks(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}   