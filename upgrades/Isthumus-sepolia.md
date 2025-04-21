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

[Details of upgrade](https://docs.optimism.io/notices/upgrade-15)
