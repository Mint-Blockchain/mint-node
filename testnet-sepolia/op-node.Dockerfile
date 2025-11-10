ARG OP_NODE_VERSION=v1.16.1
FROM us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:${OP_NODE_VERSION}

RUN apk add --no-cache jq curl

COPY --chmod=755 ./testnet-sepolia/op-node-entrypoint /opt/conduit/bin/op-node-entrypoint
ENTRYPOINT ["/opt/conduit/bin/op-node-entrypoint"]
