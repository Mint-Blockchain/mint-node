#!/bin/sh
set -eu

VERBOSITY=${GETH_VERBOSITY:-3}
GETH_DATA_DIR=/data
GETH_CHAINDATA_DIR="$GETH_DATA_DIR/geth/chaindata"

RPC_PORT="${RPC_PORT:-8545}"
WS_PORT="${WS_PORT:-8546}"

OP_GETH_GENESIS_FILE_PATH="${OP_GETH_GENESIS_FILE_PATH:-/genesis.json}"

mkdir -p $GETH_DATA_DIR

if [ ! -d "$GETH_CHAINDATA_DIR" ]; then
	echo "$GETH_CHAINDATA_DIR missing, running init"
	echo "Initializing genesis."
	geth --verbosity="$VERBOSITY" init \
		--datadir="$GETH_DATA_DIR" \
		--state.scheme=hash \
		"$OP_GETH_GENESIS_FILE_PATH"
else
	echo "$GETH_CHAINDATA_DIR exists."
fi


exec geth \
	--datadir="$GETH_DATA_DIR" \
	--state.scheme=hash \
	--verbosity="$VERBOSITY" \
	--http \
	--http.corsdomain="*" \
	--http.vhosts="*" \
	--http.addr=0.0.0.0 \
	--http.port="$RPC_PORT" \
	--http.api=web3,debug,eth,net,engine,txpool \
	--authrpc.addr=0.0.0.0 \
	--authrpc.port=8551 \
	--authrpc.vhosts="*" \
	--authrpc.jwtsecret=/jwtsecret \
	--ws \
	--ws.addr=0.0.0.0 \
	--ws.port="$WS_PORT" \
	--ws.origins="*" \
	--ws.api=web3,debug,eth,net,engine,txpool \
	--metrics \
	--metrics.addr=0.0.0.0 \
	--metrics.port=6060 \
	--syncmode=full \
	--gcmode=archive \
	--nodiscover=true \
	--rollup.disabletxpoolgossip=true \
	--networkid=185 \
	--gpo.blocks=10 \
	--gpo.minsuggestedpriorityfee=10000000 \
	--override.fjord=1720627201 \
	--override.granite=1726070401 \
	--override.holocene=1736445601 \
    --override.isthmus=1746806401
