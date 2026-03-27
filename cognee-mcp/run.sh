#!/bin/bash

# Sync with upstream (best-effort, don't block MCP startup)
cd /home/xuananh/repo/cognee/
git remote add upstream https://github.com/topoteretes/cognee.git 2>/dev/null || true
if git fetch upstream 2>/dev/null; then
    git rebase upstream/main 2>/dev/null || git rebase --abort 2>/dev/null
    git push --force-with-lease origin main 2>/dev/null || true
fi
###############################################################################
# Start Copilot proxy (if not already running) then launch cognee MCP server
###############################################################################


set -euo pipefail
cd "$(dirname "$0")"

PROXY_PORT=5221

# Start proxy in background if port is not already in use; ignore failures
if ! lsof -iTCP:"$PROXY_PORT" -sTCP:LISTEN -t &>/dev/null; then
    echo "Starting Copilot proxy on port $PROXY_PORT..."
    /home/xuananh/repo/vscode-copilot-chat/proxy_server/start.sh --port $PROXY_PORT &>/dev/null &
    disown
    # Give it a moment to bind
    sleep 2
else
    echo "Copilot proxy already running on port $PROXY_PORT"
fi

# Start cognee MCP server (stdio mode, with migrations)
echo "Starting cognee MCP server..."
exec uv run python src/server.py "$@"
