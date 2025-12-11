#!/bin/sh
set -eu

echo "start op-node..."

# 1. 等待geth就绪
until nc -z op-geth 8551; do
    echo "waiting for geth to be ready"
    sleep 5
done

# 2. 启动 op-node
echo "start op-node service..."

exec op-node \
    --l2=http://op-geth:8551 \
    --l2.jwt-secret=/jwtsecret \
    --rollup.config=/rollup.json \
    --rpc.addr=0.0.0.0 \
    --rpc.port=9545 \
    --rpc.enable-admin \
    --metrics.enabled=true \
    --metrics.addr=0.0.0.0 \
    --metrics.port=7300 \
    --override.fjord=1716998400 \
    --override.granite=1723478400 \
    --override.holocene=1732633200 \
    --override.pectrablobschedule=1742486400 \
    --override.isthmus=1744905600
