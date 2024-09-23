![Mint](logo.png)

# Mint node

It currently supports Optimism’s open-source [OP Stack](https://stack.optimism.io/).

This repository contains the relevant Docker builds to run your own RPC node for Mint Blockchain.

### Software requirements

- [Docker](https://docs.docker.com/desktop/)
- [Python 3](https://www.python.org/downloads/)

### Hardware requirements

We recommend you have this configuration to run a node:

- at least 2 Core * 8 GB RAM
- an SSD drive with at least 150 GB free

### Usage

1. ensure you have an Ethereum L1 full node RPC available:

* setting `OP_NODE_L1_ETH_RPC`. If running your own L1 node, it needs to be fully synced.
* You also need a Beacon API RPC which can be set in `OP_NODE_L1_ETH_RPC`.

Example:
```
# .env file
OP_NODE_L1_ETH_RPC=https://eth-mainnet.g.alchemy.com/v2/<your key>
OP_NODE_L1_BEACON=<beacon api rpc>
```

2. Start the node

* for Mint Mainnet
```
docker compose -f docker-compose-mainnet.yml up --build
```
* for Mint Sepolia
```
docker compose -f docker-compose-testnet-sepolia.yml up --build
```

3. Test your node:

```
curl -d '{"id":0,"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest",false]}' -H "Content-Type: application/json" http://localhost:8545
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

3. By default, the node type is `Archive`. you can change the type of node via modify the value of `--gcmode` in the `op-geth-entrypoint` file. 

```
# for full node
--gcmode=full
```

### Snapshots

Not yet available. We're working on it

### Syncing

Sync speed depends on your L1 node, as the majority of the chain is derived from data submitted to the L1. You can check your syncing status using the `optimism_syncStatus` RPC on the `op-node` container. Example:

```
command -v jq  &> /dev/null || { echo "jq is not installed" 1>&2 ; }
echo Latest synced block behind by: $((($( date +%s )-\
$( curl -s -d '{"id":0,"jsonrpc":"2.0","method":"optimism_syncStatus"}' -H "Content-Type: application/json" http://localhost:7545 | jq -r .result.unsafe_l2.timestamp))/60)) minutes
```

### Network Stats

You can see how many nodes you are connected with the following command:

```
curl -d '{"id":0,"jsonrpc":"2.0","method":"opp2p_peerStats","params":[]}' -H "Content-Type: application/json" http://localhost:7545
```

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Mint-Blockchain/mint-node/issues) or reach out on our [Discord](https://discord.com/invite/mint-blockchain):
