// SPDX-License-Identifier: MIT
// Pragma is the keyword that you use to ask the compiler to check whether its version of 
// Solidity matches the one required. A match means your source file can run successfully. 
// If it doesn't match, the compiler will give an error.
pragma solidity >=0.4.22 <0.8.13;

//Contract source files always start with the definition contract ContractName.
contract Migrations {
    //state variables
    address public owner = msg.sender;
    uint256 public last_completed_migration;

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }
}
