// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Island {

    //State Variables
    uint dailyMostVotesTally;
    uint dailyMostVotesId;
    mapping (uint => uint) idToDailyVotes;

    struct dailyVotes {
      mapping (uint => bool) votedToday;
    }


    function beginSale() {

    }

    function mint() {

    }

    function startVoting() {

    }

    function vote(uint _id, uint[] votingIds) public{
      //require voting ids have only voted once today
      for(uint i; i < votingIds.length; ){
        if(votedToday[votingIds[i]]) { revert(); } //voting ID has already started
        votedToday[votingIds[i]]
        ++i;
      }
      //TODO: require voting has started

      idToDailyVotes[_id] = idToDailyVotes[_id] + votingIds.length;
      if(idToDailyVotes[_id] > dailyMostVotesTally){
        //_id has the most votes so far today
        dailyMostVotesTally = idToDailyVotes[_id];
        dailyMostVotesId = _id;
      }
    }

    function processDailyVote() public{
      //require vote begin time >= 24 hours
    }
}
