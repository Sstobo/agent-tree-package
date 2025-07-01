


## Serena MCP Setup for Future Projects


You do this in two steps. One is setting up the server, which will run in the background. The next is adding the MCP to Claude Code.
### Prerequisites
- Install `uv` package manager:
 ```bash
 curl -LsSf https://astral.sh/uv/install.sh | sh
 ```


### Installation Steps
• Clone Serena repository to workspace directory
• Navigate to Serena directory and install dependencies:
 ```bash
 uv venv
 source .venv/bin/activate
 uv pip install --all-extras -r pyproject.toml -e .
 ```


### Claude Code Integration
• Add Serena as MCP server:
 ```bash
 claude mcp add serena -- /Users/USERNAME/.local/bin/uv "run" --directory /path/to/serena serena-mcp-server --context ide-assistant


 ie: claude mcp add serena -- uv run --directory /Users/seanstobo/Desktop/Workshop/serena serena-mcp-server --context ide-assistant --project /Users/seanstobo/Desktop/Workshop/darby3
 ```
• Restart Claude Code after adding MCP server
• Activate project: Use `activate_project` tool with project directory path
• Run onboarding: Use `onboarding` tool to learn project structure
• Create memories: Store project information with `write_memory` tool


### Available Serena Tools
• **Code Navigation**: `find_symbol`, `get_symbols_overview`, `find_referencing_symbols`
• **Intelligent Editing**: `replace_symbol_body`, `insert_after_symbol`, `replace_regex`
• **Project Memory**: `write_memory`, `read_memory`, `list_memories`
• **Analysis**: `search_for_pattern`, `think_about_collected_information`


### Benefits
• Semantic code understanding beyond text search
• Persistent project knowledge across sessions
• Symbol-level editing with automatic indentation
• Real-time project structure analysis
