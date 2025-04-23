![Mint](logo.png)

# Mint Node

It currently supports Optimism’s open-source [OP Stack](https://docs.optimism.io/stack/getting-started).

This repository contains the relevant Docker builds to run your own RPC node for Mint Blockchain.

### Hardware Requirements

Recommend configuration to run a node:

- at least 2 Core * 8 GB RAM
- an SSD drive with at least 200 GB free

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

1. You can map a local data directory for `op-geth` by adding volume mapping to `docker-compose-xxx.yml`:
```
services:
  geth: # this is Optimism's geth client
    volumes:
      - /data/node_data:/data
```

2. Default node type is `archive`. you can change it via `op-geth-entrypoint`.

```
--gcmode=full
```

### Snapshots

#### Mainnet
  - **Archive** https://storage.googleapis.com/mint-snapshot/mint-mainnet-archive-snapshot-20250214.tar.zst
  - **Full**    https://storage.googleapis.com/mint-snapshot/mint-mainnet-full-snapshot-20250214.tar.zst

#### Testnet
  - **Archive** https://storage.googleapis.com/mint-snapshot/mint-sepolia-archive-snapshot-20250214.tar.zst

#### Usage
```sh
mkdir -p /data/node_data/geth

# Download, You can choose one of two ways to download，Using aria2c to download can improve download speed, but you need to install aria2
step1: download

wget -c  https://storage.googleapis.com/mint-snapshot/mint-mainnet-archive-snapshot-20250214.tar.zst 

step2: unarchive

aria2c -x 16 -s 16 -k 100M  https://storage.googleapis.com/mint-mainnet-archive-snapshot-20250214.tar.zst 

# unzip snapshot to the ledger path:
tar --use-compress-program=unzstd -xvf mint-mainnet-archive-snapshot-20250214.tar.zst -C /data/node_data/geth

step3: check
$ ls /data/node_data/geth
chaindata
```

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues) or reach out on our [Discord](https://discord.com/invite/mint-blockchain):
