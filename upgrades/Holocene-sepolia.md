## Holocene sepolia upgrade
```
The Holocene upgrade for the Sepolia Superchain will be activated at Tue Nov 26 at 15:00:00 UTC (1732633200).
```

Node operators need to update your client before the activation date.

#### step 1: stop node
```
docker compose down
```

#### step 2: pull latest repo
```
git pull
```

#### step 3: confirm flag config
```
Confirm that both op-geth-entrypoint and op-node-entrypoint are configured with the following flags: --override.fjord=1716998400, --override.granite=1723478400, and --override.holocene=1732633200.

Ensure that channel_timeout_granite and use_plasma have been removed from rollup.json.
```

#### step 4: start node
```
docker compose up --build
```

[Details of Holocene sepolia upgrade](https://docs.optimism.io/builders/notices/holocene-changes)

| Network | op-node | op-geth |
| ------- | ------- | ------- |
| Mint Sepolia | v1.10.0 | v1.101411.2 |

