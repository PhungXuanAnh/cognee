# Task Completion Checklist

After completing a task:
1. Run `uv run ruff check .` to check for lint errors
2. Run `uv run ruff format .` to format code
3. Run relevant tests: `uv run pytest cognee/tests/unit/ -v`
4. Verify no regressions in related tests
5. Ensure code follows double-quote string convention
6. Never push code to remote server directly
7. Never submit PR review comments directly
