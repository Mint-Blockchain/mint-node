![Mint](logo.png)

# Mint Staking Node

This repository contains the relevant Docker builds to run your own RPC node for Mint Blockchain.

### Software requirements

- [Docker](https://docs.docker.com/desktop/)

### Hardware requirements

We recommend you have this configuration to run a node:

- at least 2 Core * 8 GB RAM
- an SSD drive with at least 150 GB free

### Usage

1. ensure you have an Ethereum L1 full node RPC available:

* setting `OP_NODE_L1_ETH_RPC`. If running your own L1 node, it needs to be fully synced.
* You also need a Beacon API RPC which can be set in `OP_NODE_L1_ETH_RPC`.

2. Start the node

* for Mint Mainnet
```
docker compose -f docker-compose-mainnet-staking.yml up --build
```
* for Mint Sepolia
```
docker compose -f docker-compose-testnet-sepolia-staking.yml up --build
```

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues) or reach out on our [Discord](https://discord.com/invite/mint-blockchain):
