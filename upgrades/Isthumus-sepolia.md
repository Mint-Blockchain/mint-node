## Isthumus sepolia upgrade
```
The Isthumus upgrade for the Sepolia Superchain will be activated at Thu Apr 17 16:00:00 UTC 2025 (1744905600) .
```

Node operators need to update your client before the activation date.

#### step 1: stop node
```
docker compose -f docker-compose-testnet-sepolia.yml down
```

#### step 2: pull latest repo
```
git pull
```

#### step 3: start node
```
docker compose -f docker-compose-testnet-sepolia.yml up --build -d
```

#### Main Changes
1. add activation-timestamp `--override.isthmus=1744905600` for both op-node and op-geth

2. upgrade client version:
* op-node `v1.13.2`
* op-geth `v1.101503.4`

[Details of upgrade](https://docs.optimism.io/notices/upgrade-15)
