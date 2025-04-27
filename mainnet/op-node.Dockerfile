ARG OP_NODE_VERSION=v1.13.2
FROM us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:${OP_NODE_VERSION}

RUN apk add --no-cache jq curl

COPY --chmod=755 ./mainnet/op-node-entrypoint /opt/conduit/bin/op-node-entrypoint
ENTRYPOINT ["/opt/conduit/bin/op-node-entrypoint"]
