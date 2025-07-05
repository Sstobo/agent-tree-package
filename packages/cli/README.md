# agent-tree

The shadcn/ui for AI agents.

## Usage

```bash
npx agent-tree <agent-name>
```

## Example

```bash
npx agent-tree servitor
```

## Available Agents

- **servitor** - Project management and agent coordination
- **convex-bot** - Convex database specialist  
- **pm** - Project management assistant
- **lil-fixit** - Quick fixes and small tasks
- **overseer** - Deploys and manages agent swarms
- **prospector** - Creates detailed business prospect reports and finds leads
- **notion-bot** - Instructed in the use of Notion MCP. Will assist in installation

## MCP Servers (OPTIONAL)

This project integrates with several MCP (Model Context Protocol) servers:

- **Notion MCP** - Notion workspace integration ([docs](https://github.com/Notion-MCP/notion-mcp))
- **Serena MCP** - AI assistant capabilities ([docs](https://github.com/serena-mcp/serena-mcp))
- **Convex MCP** - Convex database operations ([docs](https://github.com/get-convex/convex-mcp))
- **Context7 MCP** - Context management ([docs](https://github.com/context7/context7-mcp))

Installation guides for each MCP server are available in the `agent-tree/mcp-installation-docs/` directory.

## What It Does

Copies agent files to your project:
- `agent-tree/{agent-name}/` - Agent tasks, workflows, and docs
- `.claude/commands/{agent-name}.md` - Claude Code activation

Then use `/{agent-name}` in Claude Code to activate.

## Philosophy

Simple. Just copies files. No config. No dependencies. No complexity.

## License

MIT