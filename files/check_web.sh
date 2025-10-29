#!/usr/bin/env bash
set -Eeuo pipefail

PORT="${1:-80}"
DOCROOT="${2:-/var/www/html}"
HOST="127.0.0.1"

log() { logger -t check_web.sh -- "$*"; }

if ! timeout 2 bash -c ">/dev/tcp/${HOST}/${PORT}" 2>/dev/null; then
  log "FAIL: TCP port ${PORT} closed"
  exit 2
fi

if [[ ! -f "${DOCROOT}/index.html" ]]; then
  log "FAIL: index.html missing"
  exit 3
fi

log "OK: web check passed"
exit 0