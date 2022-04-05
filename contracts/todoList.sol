// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract TodoList {
    uint256 public todoCount = 0;

    struct Task {
        uint id;
        string taskName;
        bool isCompleted;
    }

    mapping(uint => Task) public tasks;

    constructor() public {
        createNewTask("Inital Task");
    }

    function createNewTask(string memory taskName) public {
        todoCount++;
        tasks[todoCount] = Task(todoCount, taskName, false);
    }

    function udpateTask(
        uint _id,
        string memory _taskname,
        bool isCompleted
    ) public {
        uint todoIndex = findById(_id);
        tasks[todoIndex].taskName = _taskname;
        tasks[todoIndex].isCompleted = isCompleted;
    }

    function findById(uint _id) internal view returns (uint) {
        for (uint i = 0; i <= todoCount; i++) {
            if (tasks[i].id == _id) {
                return i;
            }
        }
    }

    function getAll() public view returns (Task[] memory) {
        Task[] memory ret = new Task[](todoCount);
        for (uint i = 0; i < todoCount; i++) {
            ret[i] = tasks[i];
        }
        return ret;
    }
}
