### Granite upgrade
```
The Granite upgrade on Mint Mainnet will be activated at 1726070401 - Wed 11 Sep 2024 16:00:01 UTC
```

Node operators need to update your client before the activation date.

step 1: stop node
```
docker compose down
```

step 2: pull latest repo
```
git pull
```

step 3: confirm flag config
```
Confirm that both op-geth-entrypoint and op-node-entrypoint are set with --override.fjord=1720627201 and --override.granite=1726070401

Confirm that da_challenge_address, da_challenge_window, da_resolve_window, and use_plasma have been deleted from rollup.json
```

step 4: start node
```
docker compose up --build
```

[Details of Granite upgrade](https://docs.optimism.io/builders/notices/granite-changes)

| Network | op-node | op-geth |
| ------- | ------- | ------- |
| Mint Mainnet | v1.9.1 | v1.101408.0 |

### Software requirements

- [Docker](https://docs.docker.com/desktop/)
- [Python 3](https://www.python.org/downloads/)