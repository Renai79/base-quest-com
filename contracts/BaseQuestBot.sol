// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseQuestBot {
    address public owner;
    mapping(address => bool) public hasCompleted;

    event QuestCompleted(address indexed user);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function completeQuest() external {
        require(!hasCompleted[msg.sender], "Already completed");
        hasCompleted[msg.sender] = true;
        emit QuestCompleted(msg.sender);
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
