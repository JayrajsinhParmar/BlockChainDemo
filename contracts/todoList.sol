// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    uint256 public todoCount = 0;

    struct Task {
        uint id;
        string taskName;
        bool isCompleted;
    }

    mapping(uint => Task) public tasks;

    constructor() public
    {
        createNewTask("Inital Task");
    }

    function createNewTask(string memory taskName) public {
        todoCount++;
        tasks[todoCount] = Task(todoCount, taskName, false);
    }
}
