# Mint Node

This repository contains the relevant to run your own RPC node for Mint Blockchain.

### Hardware Requirements

Recommend minimal configuration to run a node:

- 2 Core * 8 GB RAM
- 800GB SSD Drive (Archive Node)

### Running Node

#### Step1: Setting ETH L1 RPC

* setting `OP_NODE_L1_ETH_RPC` and `OP_NODE_L1_BEACON`
```
# .env
OP_NODE_L1_ETH_RPC=<ETH L1 RPC>
OP_NODE_L1_BEACON=<Beacon RPC>
```

#### Step2: Start the Node

* 启动op-geth
```
docker compose -f docker-compose.yml up -d op-geth
```
* 启动op-node
```
docker compose -f docker-compose.yml up -d op-node
```

#### Step3: Check your node

```
curl -d '{"id":0,"jsonrpc":"2.0","method":"eth_blockNumber","params":[]}' -H "Content-Type: application/json" http://localhost:8545
```

#### Tips

Default node type is `archive`. you can change it via `--gcmode`.


### Snapshots

#### Mainnet
* 快照时间为: 2025-12-08 21:05 ( UTC+9 )
* Archive: https://storage.googleapis.com/conduit-networks-snapshots/mint-mainnet-0/latest.tar

### Troubleshooting

If you encounter problems, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues)
