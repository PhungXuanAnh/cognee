# Cognee Project Overview

## Purpose
Cognee is an open-source AI memory platform that transforms raw data into persistent knowledge graphs for AI agents. It replaces traditional RAG with an ECL (Extract, Cognify, Load) pipeline combining vector search, graph databases, and LLM-powered entity extraction.

## Core Workflow: add → cognify → search/memify
1. `add()` - Ingest data (files, URLs, text) into datasets
2. `cognify()` - Extract entities/relationships and build knowledge graph  
3. `search()` - Query knowledge using various retrieval strategies
4. `memify()` - Enrich graph with additional context and rules

## Tech Stack
- Language: Python >= 3.10, < 3.14
- Package Manager: uv (recommended)
- Web Framework: FastAPI
- Frontend: Next.js (cognee-frontend/)
- MCP Server: FastMCP library (cognee-mcp/)
- Default DBs: SQLite (relational), LanceDB (vector), Kuzu (graph)
- LLM: OpenAI default, supports Anthropic/Gemini/Ollama/etc.

## Key Directories
- cognee/ - Core Python library and API
- cognee-mcp/ - MCP server (separate sub-project with own pyproject.toml)
- cognee-frontend/ - Next.js UI
- distributed/ - Distributed execution utilities
- examples/ - Example scripts
