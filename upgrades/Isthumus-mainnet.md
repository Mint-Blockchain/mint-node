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

[Details of upgrade](https://docs.optimism.io/notices/upgrade-15)
