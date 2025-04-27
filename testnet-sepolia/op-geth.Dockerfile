ARG OP_GETH_VERSION=v1.101503.4
FROM us-docker.pkg.dev/oplabs-tools-artifacts/images/op-geth:${OP_GETH_VERSION}

RUN apk add --no-cache jq curl

COPY --chmod=755 ./testnet-sepolia/op-geth-entrypoint /opt/conduit/bin/op-geth-entrypoint
ENTRYPOINT ["/opt/conduit/bin/op-geth-entrypoint"]
