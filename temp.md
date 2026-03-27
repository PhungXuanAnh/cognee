User: explain the current project
i want to setup cognee_mcp in all the project as cognee-mcp/README.md by adding to this file ~/.config/Code/User/mcp.json

refer to serena mcp server using --refresh to pull latest version before starting

tell me on how to using this cognee_mcp server efficiently
#serena


GitHub Copilot: 

I'll start by activating the Serena project for onboarding, then explore the cognee-mcp setup to provide you with a proper configuration and usage guide. 

Ran Activate Project 
Completed with input: {
  "project": "/home/xuananh/Documents/cognee"
}

Ran Check Onboarding Performed 
Completed with input: {}

Ran Onboarding 
Completed with input: {}

Created 4 todos

Let me gather key project info for onboarding.  

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/server.py#1-1), lines 1 to 100

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/pyproject.toml)

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src)

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/server.py#100-100), lines 100 to 200

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/server.py#200-200), lines 200 to 400

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/server.py#400-400), lines 400 to 700

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/server.py#700-700), lines 700 to 1000

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/server.py#1000-1000), lines 1000 to 1021

Now let me look at the `__init__.py` entry point and client module:  

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/client.py#1-1), lines 1 to 50

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/__init__.py#1-1), lines 1 to 50

Now I have enough context. Let me also check how scripts entry points work to understand the correct way to run cognee-mcp via `uvx`: 

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/src/__init__.py#50-50), lines 50 to 61

Good, so cognee-mcp is the correct entry point command. Now let me check the Dockerfile for entrypoint pattern:  

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/entrypoint.sh#1-1), lines 1 to 30

Read [](file:///home/xuananh/Documents/cognee/cognee-mcp/Dockerfile#1-1), lines 1 to 60

Now let me check whether cognee-mcp is published on PyPI (to use with `uvx`): 



Fetched https://pypi.org/project/cognee-mcp/



Fetched https://www.google.com/search?q=cognee-mcp+pypi+package

Let me check if cognee-mcp is available on PyPI for `uvx` usage: 

Ran terminal command:  pip index versions cognee-mcp 2>/dev/null || echo "Not found on PyPI"

Ran terminal command:  pip index versions cognee 2>/dev/null | head -5

Let me check if there's already a `.env` file set up and test the uvx with git subdirectory approach:  

Ran terminal command:  ls -la /home/xuananh/Documents/cognee/.env 2>/dev/null && echo "EXISTS" || echo "NO .env file"

Ran terminal command:  ls -la /home/xuananh/Documents/cognee/.env.template 2>/dev/null && echo "EXISTS" || echo "NO .env.template"

Ran terminal command:  ls -la /home/xuananh/Documents/cognee/cognee-mcp/.env 2>/dev/null && echo "EXISTS" || echo "NO cognee-mcp/.env"

Now let me check the uv.lock or if we can verify `uvx --from git+...#subdirectory=...` works:   

Ran terminal command:  uvx --help 2>&1 | head -30

Ran terminal command:  uvx --help 2>&1 | grep -A2 "refresh"

Good, `uvx` supports `--refresh`. Now let me verify the git subdirectory approach: 



Fetched https://docs.astral.sh/uv/concepts/dependencies/#git



Fetched https://docs.astral.sh/uv/pip/packages/#installing-a-package



Fetched https://docs.astral.sh/uv/guides/tools/

Now let me save onboarding memories and then provide the complete configuration. Let me first write the key project memories: 

Ran Write Memory 
Completed with input: {
  "memory_name": "project_overview",
  "content": "# Cognee Project Overview\n\n## Purpose\nCognee is an open-source AI memory platform that transforms raw data into persistent knowledge graphs for AI agents. It replaces traditional RAG with an ECL (Extract, Cognify, Load) pipeline combining vector search, graph databases, and LLM-powered entity extraction.\n\n## Core Workflow: add → cognify → search/memify\n1. `add()` - Ingest data (files, URLs, text) into datasets\n2. `cognify()` - Extract entities/relationships and build knowledge graph  \n3. `search()` - Query knowledge using various retrieval strategies\n4. `memify()` - Enrich graph with additional context and rules\n\n## Tech Stack\n- Language: Python >= 3.10, < 3.14\n- Package Manager: uv (recommended)\n- Web Framework: FastAPI\n- Frontend: Next.js (cognee-frontend/)\n- MCP Server: FastMCP library (cognee-mcp/)\n- Default DBs: SQLite (relational), LanceDB (vector), Kuzu (graph)\n- LLM: OpenAI default, supports Anthropic/Gemini/Ollama/etc.\n\n## Key Directories\n- cognee/ - Core Python library and API\n- cognee-mcp/ - MCP server (separate sub-project with own pyproject.toml)\n- cognee-frontend/ - Next.js UI\n- distributed/ - Distributed execution utilities\n- examples/ - Example scripts\n"
}

Ran Write Memory 
Completed with input: {
  "content": "# Suggested Commands\n\n## Setup\n```bash\nuv sync --dev --all-extras --reinstall  # in root or cognee-mcp/\n```\n\n## Testing\n```bash\nuv run pytest cognee/tests/unit/ -v\nuv run pytest cognee/tests/integration/ -v\n```\n\n## Linting & Formatting\n```bash\nuv run ruff check .\nuv run ruff format .\n```\n\n## Running\n```bash\n# CLI\nuv run cognee-cli add \"text\"\nuv run cognee-cli cognify\nuv run cognee-cli search \"query\"\nuv run cognee-cli -ui  # Full stack UI\n\n# FastAPI server\nuv run python -m cognee.api.client\n\n# MCP server (in cognee-mcp/)\npython src/server.py                     # stdio (default)\npython src/server.py --transport sse     # SSE\npython src/server.py --transport http    # HTTP\n```\n\n## Git\n- Always branch from `dev`, not `main`\n- Use conventional commit styling in PR titles\n",
  "memory_name": "suggested_commands"
}

Ran Write Memory 
Completed with input: {
  "content": "# Code Style & Conventions\n\n- 4-space indentation\n- Modules and functions: snake_case\n- Classes: PascalCase\n- Double quotes (enforced by ruff-format)\n- Line length: 100 characters (configured in pyproject.toml)\n- Type hints encouraged (mypy checks enabled)\n- Use ruff format before committing\n- Use structured error handling (cognee.shared.logging_utils)\n- Test files: test_*.py, use pytest.mark.asyncio for async\n- Tests in cognee/tests/ (unit/, integration/, cli_tests/)\n",
  "memory_name": "style_conventions"
}

Ran Write Memory 
Completed with input: {
  "content": "# Task Completion Checklist\n\nAfter completing a task:\n1. Run `uv run ruff check .` to check for lint errors\n2. Run `uv run ruff format .` to format code\n3. Run relevant tests: `uv run pytest cognee/tests/unit/ -v`\n4. Verify no regressions in related tests\n5. Ensure code follows double-quote string convention\n6. Never push code to remote server directly\n7. Never submit PR review comments directly\n",
  "memory_name": "task_completion"
}

Starting: *Configure mcp.json for cognee-mcp* (3/4)

Now let me read the current mcp.json to prepare the edit: 

Read [](vscode-userdata:/home/xuananh/.config/Code/User/mcp.json#1-1), lines 1 to 50

Now I have all the context needed. Let me configure the mcp.json with the cognee-mcp server entry:   

Replacing 10 lines with 34 lines in [](vscode-userdata:/home/xuananh/.config/Code/User/mcp.json)


```

```
Now create the `.env` file with the minimal required setup:  

Read [](file:///home/xuananh/Documents/cognee/.env.template#1-1), lines 1 to 30

Created [](file:///home/xuananh/Documents/cognee/.env)

Starting: *Explain project and usage guide* (4/4)

Now let me verify the final mcp.json state:   

Read [](vscode-userdata:/home/xuananh/.config/Code/User/mcp.json#1-1), lines 1 to 70

Completed: *Explain project and usage guide* (4/4)

---

## Project Overview: Cognee

**Cognee** is an open-source AI memory platform that transforms raw data into **persistent knowledge graphs** for AI agents. Instead of traditional RAG (Retrieval-Augmented Generation), it uses an **ECL pipeline**: Extract → Cognify → Load, combining vector search, graph databases, and LLM-powered entity extraction.

The core workflow is: **`add` → `cognify` → `search`**

---

## What I configured

I added cognee-mcp to your mcp.json with the `--refresh` pattern (like serena), pulling latest from the `dev` branch:

```jsonc
"cognee-mcp": {
    "type": "stdio",
    "command": "uvx",
    "args": [
        "--refresh",
        "--from",
        "cognee-mcp @ git+https://github.com/topoteretes/cognee.git@dev#subdirectory=cognee-mcp",
        "--env-file",
        "/home/xuananh/Documents/cognee/.env",
        "cognee-mcp"
    ]
}
```

I also included a commented-out **Option 2** for local development (faster, no git pull):
```jsonc
// "cognee-mcp": {
//     "type": "stdio",
//     "command": "uv",
//     "args": ["--directory", "/home/xuananh/Documents/cognee/cognee-mcp", "run", "cognee-mcp"]
// }
```

### Required setup step
Edit .env and replace `YOUR_OPENAI_API_KEY_HERE` with your actual OpenAI API key.

---

## How to Use cognee-mcp Efficiently

### Available Tools (10 tools)

| Tool | Purpose | When to use |
|------|---------|-------------|
| **`cognify`** | Ingest data + build knowledge graph | Feed text, files, or URLs into memory |
| **`search`** | Query the knowledge graph | Retrieve information with different strategies |
| **`codify`** | Analyze code repos, build code graph | Understanding codebases |
| **`save_interaction`** | Log user-agent Q&A pairs | Auto-learn from conversations |
| **`cognee_add_developer_rules`** | Ingest `.cursorrules`, `AGENT.md`, etc. | Bootstrap developer rules |
| **`get_developer_rules`** | Retrieve learned dev rules | Get coding conventions |
| **`list_data`** | List all datasets and data items | Browse stored knowledge |
| **`delete`** | Remove specific data (soft/hard) | Clean up bad entries |
| **`prune`** | Full reset of all data | Start fresh |
| **`cognify_status` / `codify_status`** | Track pipeline progress | Check if background processing finished |

### Search Types (most important)

| Type | Speed | Best for |
|------|-------|----------|
| **`GRAPH_COMPLETION`** | Slower | Complex Q&A with full graph context + LLM reasoning (recommended) |
| **`RAG_COMPLETION`** | Medium | Traditional RAG, specific fact-finding |
| **`CHUNKS`** | Fast | Finding specific passages, citations |
| **`CODE`** | Medium | Functions, classes, code patterns |
| **`SUMMARIES`** | Fast | Quick overviews, document abstracts |
| **`FEELING_LUCKY`** | Variable | Auto-selects best search type |
| **`CYPHER`** | Fast | Direct graph database queries (advanced) |

### Efficient Usage Workflow

1. **Feed your knowledge**: Use `cognify` with relevant docs, code, or text
2. **Wait for processing**: Use `cognify_status` to check when background task completes
3. **Query**: Use `search` with `GRAPH_COMPLETION` for intelligent answers, `CHUNKS` for speed
4. **Learn from interactions**: Use `save_interaction` to capture useful Q&A patterns and auto-generate rules
5. **Bootstrap rules**: Use `cognee_add_developer_rules` once per project to index `.cursorrules`, `AGENT.md`, etc.

### Tips
- `cognify` launches background tasks - always check `cognify_status` before searching
- Use `FEELING_LUCKY` search type when unsure which search mode fits your query
- The `top_k` parameter in search controls result volume (3-5 for focused, 10-20 for comprehensive)
- Default databases (SQLite, LanceDB, Kuzu) are file-based - zero extra setup needed
- For production or shared use, switch to the **API mode** (separate Cognee FastAPI server + MCP connecting to it)

---

Is there anything you'd like me to adjust in the configuration, or do you have any questions about using cognee-mcp?

Made changes.

User: why cognee need LLM_API_KEY? does it need to use LLM to build its knowledge graph? can i use copilot? how?
where does its database reside? can each repo workspace/repo have a separate db? how?
#serena 
help me create an instruction for AI agent to use cognee_mcp most effective, in markdown file, make it short, tight, solid, concise, but still easy for AI agent to follow and undertand

GitHub Copilot: 

 

Ran Activate Project 
Completed with input: {
  "project": "/home/xuananh/Documents/cognee"
}

Created 2 todos

Let me research the key areas in parallel: 

Research cognee LLM/DB/Copilot questions

Read [](file:///home/xuananh/Documents/cognee/cognee/root_dir.py)

Read [](file:///home/xuananh/Documents/cognee/.env.template#1-1), lines 1 to 150

Read [](file:///home/xuananh/Documents/cognee/cognee/base_config.py)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm)

Read [](file:///home/xuananh/Documents/cognee/cognee/tasks/graph/extract_graph_from_data.py#1-1), lines 1 to 150

Read [](file:///home/xuananh/Documents/cognee/cognee/api/v1/cognify/cognify.py#1-1), lines 1 to 150

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/LLMGateway.py)

Read [](file:///home/xuananh/Documents/cognee/cognee/tasks/graph/extract_graph_from_data.py#150-150), lines 150 to 234

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/config.py#1-1), lines 1 to 100

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/extraction)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/extraction/texts.json)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/extraction/__init__.py)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/__init__.py)

Read [](file:///home/xuananh/Documents/cognee/cognee/tasks/summarization/summarize_text.py)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/extraction/knowledge_graph/extract_content_graph.py)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/config.py#75-75), lines 75 to 200

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/structured_output_framework)

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/structured_output_framework/litellm_instructor/llm/get_llm_client.py#1-1), lines 1 to 200

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/structured_output_framework/litellm_instructor)

Searched for regex `DATA_ROOT_DIRECTORY|SYSTEM_ROOT_DIRECTORY`, 20 results

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/structured_output_framework/litellm_instructor/llm/generic_llm_api/adapter.py#1-1), lines 1 to 100

Read [](file:///home/xuananh/Documents/cognee/cognee/infrastructure/llm/extraction/extract_summary.py#1-1), lines 1 to 50

Searched for regex `database isolation|multi-tenant|per.*dataset|per.*workspace`, 20 results

Read [](file:///home/xuananh/Documents/cognee/.env.template#60-60), lines 60 to 230

Searched for regex `ENABLE_BACKEND_ACCESS_CONTROL|access_control_enabled`, 30 results

Read [](file:///home/xuananh/Documents/cognee/.env.template#50-50), lines 50 to 235

Searched codebase for "how are databases isolated per dataset or workspace", 21 results

Read [](file:///home/xuananh/.config/Code/User/workspaceStorage/6958538ca87a7380bc224c3d8be07153/GitHub.copilot-chat/chat-session-resources/1851fdd4-2835-40d1-ac6f-b045eb64ffc4/toolu_bdrk_01Dsbak8GKNyGCehQKdHBqR5__vscode-1774617056958/content.txt#1-1), lines 1 to 200

Excellent research. Now let me create the instruction file: 

Starting: *Create cognee-mcp instruction file* (2/2)

Created [](file:///home/xuananh/Dropbox/Work/copilot/instructions/cognee-mcp-usage.instructions.md)

Completed: *Create cognee-mcp instruction file* (2/2)

---

## Answers to Your Questions

### Why does cognee need LLM_API_KEY?

Yes, cognee **requires an LLM** to build its knowledge graph. During `cognify()`, the LLM is used for:
1. **Entity & relationship extraction** — The LLM reads each text chunk and extracts structured entities (people, concepts, orgs) and their relationships into a graph
2. **Text summarization** — Creates hierarchical summaries for navigation and search
3. **Document classification** — Categorizes documents by type

Without an LLM, cognee cannot perform any of these — it's the core intelligence behind turning raw text into structured knowledge.

### Can I use GitHub Copilot?

Yes, via the **`custom` provider**. Set in your .env:

```bash
LLM_PROVIDER="custom"
LLM_MODEL="gpt-4o"
LLM_ENDPOINT="https://api.githubcopilot.com/v1"  # or your Copilot API proxy
LLM_API_KEY="your-copilot-token"
```

Cognee uses `litellm` under the hood, which supports any OpenAI-compatible API. However, Copilot's API needs to support **structured output** (JSON schema mode) for entity extraction to work properly.

### Where does the database reside?

By default, all databases are **file-based** and stored relative to the cognee package:
- `.data_storage/` — raw data files
- `.cognee_system/` — SQLite, LanceDB, Kuzu databases
- `.cognee_cache/` — cached data

These default to inside `.venv` or the working directory.

### Can each repo/workspace have a separate DB?

**Yes!** Set these in each project's .env:

```bash
DATA_ROOT_DIRECTORY="/path/to/your/project/.cognee_data/"
SYSTEM_ROOT_DIRECTORY="/path/to/your/project/.cognee_system/"
```

For even more isolation, enable `ENABLE_BACKEND_ACCESS_CONTROL=True` which creates separate graph/vector databases per user+dataset combination.

### Instruction file created

The agent instruction file is at cognee-mcp-usage.instructions.md with `applyTo: "**"` and `inclusion: manual` — you can change `inclusion` to `always` if you want it auto-loaded for every conversation.

---

Would you like me to adjust anything in the instruction file, or do you have further questions about the setup?

Made changes.