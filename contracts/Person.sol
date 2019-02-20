pragma solidity ^ 0.5.0;

contract Person {
    string public name;
    address public owner;
    uint public balance;

    modifier onlyOwner() 
    {
        require(msg.sender == owner, "");
        _;
    }

    constructor () public 
    {
        owner = msg.sender;
        balance = 1000;
    }

    function setName(string memory _name) public onlyOwner 
    {
        name = _name;
    }
}
