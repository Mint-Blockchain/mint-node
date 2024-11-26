# Mint Staking Node

This repository contains the relevant Docker builds to run your own RPC node and IPFS node for Mint Blockchain.

### Software requirements

- [Docker](https://docs.docker.com/desktop/)

### Hardware requirements

We recommend you have this configuration to run a node:

- at least 4 Core * 16 GB RAM
- an SSD drive with at least 200 GB free

### Usage

1. Ensure you have an Ethereum L1 full node RPC available:

* setting `OP_NODE_L1_ETH_RPC`. If running your own L1 node, it needs to be fully synced.
* You also need a Beacon API RPC which can be set in `OP_NODE_L1_ETH_RPC`.

2. Start Node

* For Mint Mainnet
```
cd staking
docker compose -f docker-compose-staking-mainnet.yml up --build
```
* For Mint Sepolia
```
cd staking
docker compose -f docker-compose-staking-testnet-sepolia.yml up --build
```

3. Test your node:

* For Mint RPC
```
curl -d '{"id":0,"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest",false]}' -H "Content-Type: application/json" http://localhost:8545
```
* For IPFS Node
```
curl -I http://localhost:8088/ipfs/QmPmwb54NBPhqKTG1t2m5JtdeP3Hz2eQ9rhtGMFQEeabKm
```
#### Note
1. Some L1 nodes (e.g. Erigon) do not support fetching storage proofs. You can work around this by specifying `--l1.trustrpc` when starting op-node (add it in `op-node-entrypoint` and rebuild the docker image with `docker compose build`.) Do not do this unless you fully trust the L1 node provider.

2. You can map local data directories for op-geth and ipfs by adding volume mappings in the docker-compose-xxx.yml file:
```
services:
  ipfs:
    ...
    volumes:
      - ./data/ipfs:/data/ipfs
  geth: # this is Optimism's geth client
    ...
    volumes:
      - ./geth-data:/data
```

3. By default, the node type is `Archive`. you can change the type of node via modify the value of `--gcmode` in the `op-geth-entrypoint` file. 

```
# for full node
--gcmode=full
```

4.The IPFS gateway port is forwarded through Nginx, with the default port set to 8088. Additionally, there is a QPS limit in place, with the default value set to 20. You can modify these two parameters in the .env.nginx file as needed.
```
QPS=50r/s
PORT=8088
```

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues) or reach out on our [Discord](https://discord.com/invite/mint-blockchain)
