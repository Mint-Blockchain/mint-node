## Pectra sepolia upgrade
```
The Pectra upgrade for the Sepolia Superchain will be activated at Mar 20 at 04:00:00 UTC (1742486400).
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

#### step 3: confirm flag config

Check whether the rollup.json file has added the following content:

```
"chain_op_config": {
    "eip1559Elasticity": 6,
    "eip1559Denominator": 50,
    "eip1559DenominatorCanyon": 250
}
```

#### step 4: start node
```
docker compose -f docker-compose-testnet-sepolia.yml up --build -d
```

[Details of Pectra sepolia upgrade](https://docs.optimism.io/notices/pectra-changes)

| Network | op-node | op-geth |
| ------- | ------- | ------- |
| Mint Sepolia | v1.11.1 | v1.101500.0 |