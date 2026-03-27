# Code Style & Conventions

- 4-space indentation
- Modules and functions: snake_case
- Classes: PascalCase
- Double quotes (enforced by ruff-format)
- Line length: 100 characters (configured in pyproject.toml)
- Type hints encouraged (mypy checks enabled)
- Use ruff format before committing
- Use structured error handling (cognee.shared.logging_utils)
- Test files: test_*.py, use pytest.mark.asyncio for async
- Tests in cognee/tests/ (unit/, integration/, cli_tests/)
