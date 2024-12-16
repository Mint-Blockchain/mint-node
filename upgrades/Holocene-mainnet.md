## Holocene Mainnet upgrade
```
The Holocene upgrade for the Mainnet Superchain is optimistically scheduled for Thu 9 Jan 2025 18:00:01 UTC.
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
Confirm that both op-geth-entrypoint and op-node-entrypoint are configured with the following flags:--override.fjord=1720627201, --override.granite=1726070401 and --override.holocene=1736445601. 

```

#### step 4: start node
```
docker compose up --build
```

[Details of Holocene Mainnet upgrade](https://docs.optimism.io/builders/notices/holocene-changes)

| Network | op-node | op-geth |
| ------- | ------- | ------- |
| Mint Mainnet | v1.10.0 | v1.101411.2 |

