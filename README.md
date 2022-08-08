# The Island NFT

A collection of 1000 NFTs. Every day, 1 item is voted out of the collection,

## Rules

Am overview of the rules of the game, as enforced by the contract. This is like a high level overview of how The Island is actually implemented.

- An initial NFT sale is started by the owner, selling a max of 1000 Islanders.
- Voting NFTs out can not start until the initial sale has sold 1000 items, OR 1 month has passed.
- Anyone can call the `startVoting` function if the sale is over, to begin voting Islanders out daily.
- A reward of 49% of the initial sale revenue will go to the final holder who is the last Islander standing.
- The end of one day's vote will begin the next one once anyone has called the `processVoting` function, and all votes go for 24 hours
- Votes tally up the most voted individual Islander.
- When a daily vote is processed, the Islander with the most votes is "removed".
- When an Islander is "removed", the URI for their token is removed, and owner is set to address(0), effectively deleting it.
- When an Islander is "removed", they can no longer vote in daily votes.
- When an Islander is "removed", the previous owner is eligible to mint a new NFT with the same traits on a separate smart contract, that is still part of/a voting participant in a DAO which controls the remaining 51% of The Island treasury.
- Ties are unlikely, even in the final stages its unlikely to be 1v1. Because of the complexity limitations of looping through votes, ties are decided by who ever received the most votes _first_.

## Contract Design

These contracts are inspired by Nouns, but make many changes and handle voting differently.

### Notes

The prize can not be 100%, because then there would be too much incentive to 51% attack the initial sale right off the bat. It's very important that the sale mechanics are safe and do not allow any one person to mint a majority.

## Compile, Run, Deploy

This is a clone of the hardhat init repo. Standard hardhat commands will work here.

Install

```shell
npm install --save-dev hardhat
npm install
```

```shell
npx hardhat help
npx hardhat test
GAS_REPORT=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
