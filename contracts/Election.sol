pragma solidity ^0.5.0;

contract Election {
    //model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //store accounts that have voted
    mapping(address => bool) public voters;
     //store candidate
    //fetch candidate
    mapping(uint => Candidate) public candidates;

    //store candidiate count
    uint public candidatesCount;

    constructor() public{
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);

    }

    function vote (uint _candidateId) public{
        //record that voter has voted
        voters[msg.sender] = true;

        //update vote count
        candidates[_candidateId].voteCount ++;
    }
    
}




