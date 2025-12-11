![Mint](logo.png)

# Mint Node

This repository contains the relevant to run your own RPC node for Mint Blockchain.

### Hardware Requirements

Recommend minimal configuration to run a node:

- 2 Core * 8 GB RAM
- 800GB SSD Drive (Archive Node)

### Running Node

#### Step1: Setting ETH L1 full-node RPC

* setting `OP_NODE_L1_ETH_RPC`. need fully synced.
* setting `OP_NODE_L1_BEACON`.  need a Beacon RPC.
```
# .env
OP_NODE_L1_ETH_RPC=<your ETH rpc endpoint>
OP_NODE_L1_BEACON=<beacon api rpc>
```

#### Step2: Start the node

* Mainnet
```
docker compose -f docker-compose-mainnet.yml up --build -d
```
* Sepolia Testnet
```
docker compose -f docker-compose-testnet-sepolia.yml up --build -d
```

#### Step3: Check your node

```
curl -d '{"id":0,"jsonrpc":"2.0","method":"eth_blockNumber","params":[]}' -H "Content-Type: application/json" http://localhost:8545
```

#### Tips

Default node type is `archive`. you can change it via `--gcmode`.


### Snapshots

#### Mainnet
  - **Archive** https://storage.googleapis.com/mint-snapshot/mint-mainnet-archive-snapshot-20250214.tar.zst
  - **Full**    https://storage.googleapis.com/mint-snapshot/mint-mainnet-full-snapshot-20250214.tar.zst

#### Testnet
  - **Archive** https://storage.googleapis.com/mint-snapshot/mint-sepolia-archive-snapshot-20250214.tar.zst

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues) or reach out on our [Discord](https://discord.com/invite/mint-blockchain):
