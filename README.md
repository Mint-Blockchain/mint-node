![Mint](logo.png)

# Mint Node

It currently supports Optimism’s open-source [OP Stack](https://stack.optimism.io/).

This repository contains the relevant Docker builds to run your own RPC node for Mint Blockchain.

### Hardware requirements

we recommend this configuration to run a node:

- at least 2 Core * 8 GB RAM
- an SSD drive with at least 200 GB free

### Run a node

#### Step1: Setting ETH L1 full-node RPC

* setting `OP_NODE_L1_ETH_RPC`. need fully synced.
* setting `OP_NODE_L1_BEACON`.  need a Beacon RPC.
```
# .env file
OP_NODE_L1_ETH_RPC=https://eth-mainnet.g.alchemy.com/v2/<your key>
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

#### Note
1. Some L1 nodes (e.g. Erigon) do not support fetching storage proofs. You can work around this by specifying `--l1.trustrpc` when starting op-node (add it in `op-node-entrypoint` and rebuild the docker image with `docker compose build`.) Do not do this unless you fully trust the L1 node provider.

2. You can map a local data directory for `op-geth` by adding a volume mapping to `docker-compose-xxx.yml`:
```
services:
  geth: # this is Optimism's geth client
    ...
    volumes:
      - ./geth-data:/data
```

3. Default node type is `archive`. you can change it via `op-geth-entrypoint`.

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
mkdir -p ./data/mainnet-geth

# Download latest snapshot tarball
# You can choose one of two ways to download，Using aria2c to download can improve download speed, but you need to install aria2
step1 download

wget -c  https://storage.googleapis.com/mint-snapshot/mint-mainnet-archive-snapshot-20250214.tar.zst 

step2 unarchive

aria2c -x 16 -s 16 -k 100M  https://storage.googleapis.com/mint-mainnet-archive-snapshot-20250214.tar.zst 

# unzip snapshot to the ledger path:
tar --use-compress-program=unzstd -xvf mint-mainnet-archive-snapshot-20250214.tar.zst -C ./data/mainnet-geth
```

Check the data was unarchived successfully:

```sh
$ ls ./data/mainnet-geth
chaindata
```

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues) or reach out on our [Discord](https://discord.com/invite/mint-blockchain):
