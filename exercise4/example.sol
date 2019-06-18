pragma solidity >=0.4.22 <0.6.0;

contract Example {
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function changeOwner() public {
        owner = msg.sender;
    }
}