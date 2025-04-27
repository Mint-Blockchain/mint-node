## Isthumus mainnet upgrade
```
The Isthumus upgrade for the Mainnet Superchain will be activated at Fri May 9 2025 16:00:01 UTC (1746806401)
```

Node operators need to update your client before the activation date.

#### step 1: stop node
```
docker compose -f docker-compose-mainnet.yml down
```

#### step 2: pull latest repo
```
git pull
```

#### step 3: start node
```
docker compose -f docker-compose-mainnet.yml up --build -d
```

#### Main Changes
1. add activation-timestamp `--override.isthmus=1746806401` for both op-node and op-geth

2. upgrade client version:
* op-node `v1.13.2`
* op-geth `v1.101503.4`

[Details of upgrade](https://docs.optimism.io/notices/upgrade-15)
