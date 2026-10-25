#!/usr/bin/env bash
# Serve the form at http://localhost:8787 (add --lan to reach it from other devices on your network).
cd "$(dirname "$0")"
PORT="${PORT:-8787}"
BIND=127.0.0.1
[ "$1" = "--lan" ] && BIND=0.0.0.0
echo "Serving on http://$BIND:$PORT"
exec python3 -m http.server "$PORT" --bind "$BIND"
