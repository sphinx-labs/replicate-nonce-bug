## Foundry Library Nonce Bug Replication

## Bug
If you create a script that uses the `vm.startBroadcast(address)` cheat code to start a broadcast from an address with a nonzero nonce, then deploy a contract that uses an externally linked library, the transactions in the generated broadcast file will not all have correct nonces. The transaction to deploy the library will have the correct nonce but any following transactions will have nonces that start at 1. 

## Replication
To replicate the bug:
- run `foundryup`
- then `forge script ./script/Counter.s.sol --fork-url https://opt-sepolia.g.alchemy.com/v2/<alchemy api key>`

> Note, you'll need to either use your own Alchemy API key or just use your own RPC url for Sepolia. 

If you then open `broadcast/Counter.s.sol/11155420/dry-run/run-latest.json` and inspect the transaction nonces you'll see that the first transaction has the expected nonce, but the following transactions nonce is 1.  

### Files
- `src/Counter.sol`: Contains the contract we are going to deploy in this example. It uses an externally linked library which we expect foundry to deploy automatically when deploying this contract.
- `script/Counter.s.sol`: Contains the script that replicates the bug. It starts a broadcast from `0x4e59b44847b379578588920cA78FbF26c0B4956C` which is the address of the standard create2 factory. This contract is expected to have a nonzero nonce on Sepolia. The script then deploys the `Counter` contract.