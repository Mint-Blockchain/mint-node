#!/bin/sh
set -eu

echo "start op-node..."

# 1.waiting geth ready
until nc -z op-geth 8551; do
    echo "waiting for geth to be ready"
    sleep 5
done

# 2.start op-node
echo "start op-node service..."

exec op-node \
    --l2=http://op-geth:8551 \
    --l2.jwt-secret=/jwtsecret \
    --rollup.config=/rollup.json \
    --rpc.addr=0.0.0.0 \
    --rpc.port=9545 \
    --metrics.enabled=true \
    --metrics.addr=0.0.0.0 \
    --metrics.port=7300 \
    --verifier.l1-confs=5 \
    --override.fjord=1720627201 \
    --override.granite=1726070401 \
    --override.holocene=1736445601 \
    --override.isthmus=1746806401 \
    --override.jovian=1764691201
