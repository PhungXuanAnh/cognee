# Suggested Commands

## Setup
```bash
uv sync --dev --all-extras --reinstall  # in root or cognee-mcp/
```

## Testing
```bash
uv run pytest cognee/tests/unit/ -v
uv run pytest cognee/tests/integration/ -v
```

## Linting & Formatting
```bash
uv run ruff check .
uv run ruff format .
```

## Running
```bash
# CLI
uv run cognee-cli add "text"
uv run cognee-cli cognify
uv run cognee-cli search "query"
uv run cognee-cli -ui  # Full stack UI

# FastAPI server
uv run python -m cognee.api.client

# MCP server (in cognee-mcp/)
python src/server.py                     # stdio (default)
python src/server.py --transport sse     # SSE
python src/server.py --transport http    # HTTP
```

## Git
- Always branch from `dev`, not `main`
- Use conventional commit styling in PR titles
