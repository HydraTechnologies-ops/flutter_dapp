pragma solidity ^0.5.9;

contract HelloWorld {
string  public yourName;

    constructor() public {
        yourName = "UnKnown";
    }

    function setName (string memory nm) public {
        yourName = nm;
    }
}
