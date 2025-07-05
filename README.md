# agent-tree

The shadcn/ui for AI agents - copy-paste AI agents for Claude Code.

## Installation

```bash
npx agent-tree <agent-name>
```

## Available Agents

| Agent | Description |
|-------|-------------|
| `servitor` | Project management and agent coordination |
| `lil-fixit` | Quick fixes and small tasks |
| `pm` | Project management assistant |
| `overlord` | Multi-agent orchestrator for complex analysis |
| `notion-bot` | Notion documentation specialist (requires MCP setup) |
| `prospector` | Business lead generation and client prospecting |
| `convex-bot` | Convex database specialist |

## Usage

1. Install an agent: `npx agent-tree servitor`
2. Activate in Claude Code: `/servitor`
3. Use agent commands: `*help`, `*status`, etc.

## How it Works

Agent-tree copies agent files to your project:
- `agent-tree/{agent-name}/` - Agent files and workflows
- `.claude/commands/{agent-name}.md` - Claude Code command definition

Each agent includes documentation, tasks, workflows, and specialized tools for its domain.

## Requirements

- Node.js 18+
- Claude Code

## License

MIT