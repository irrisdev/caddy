FROM caddy:2.11-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/dynu \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.11-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy