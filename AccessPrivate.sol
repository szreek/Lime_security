// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Vault {
    uint public count = 123;
    address public owner = msg.sender;
    bool public isTrue = true;
    uint16 public u16 = 31;
    address private walletPublicKey; //instead of password to prevent rading private data
    uint public constant someConst = 123;
    bytes32[3] public data;

    struct User {
        uint id;
        address walletPublicKey; //instead of password to prevent rading private data
    }
    User[] private users;
    mapping(uint => User) private idToUser;

    constructor() {
        walletPublicKey = msg.sender;
    }

    function addUser() public {
        User memory user = User({id: users.length, walletPublicKey: msg.sender});

        users.push(user);
        idToUser[user.id] = user;
    }

    function getArrayLocation(
        uint slot,
        uint index,
        uint elementSize
    ) public pure returns (uint) {
        return uint(keccak256(abi.encodePacked(slot))) + (index * elementSize);
    }

    function getMapLocation(uint slot, uint key) public pure returns (uint) {
        return uint(keccak256(abi.encodePacked(key, slot)));
    }
}
