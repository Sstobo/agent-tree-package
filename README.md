# agent-tree

The shadcn/ui for AI agents - copy-paste AI agents for Claude Code.

## Quick Start

```bash
# Install an agent
npx agent-tree servitor

# Use in Claude Code
/servitor
```

## Available Agents

- **servitor** - Project management and agent coordination
- **convex-bot** - Convex database specialist  
- **pm** - Project management assistant
- **lil-fixit** - Quick fixes and small tasks
- **notion-bot** - Notion documentation specialist

## How It Works

1. Run `npx agent-tree <agent-name>` 
2. Files copied to `agent-tree/` and `.claude/commands/`
3. Activate with `/<agent-name>` in Claude Code
4. Agents coordinate through shared files

## Development

```bash
cd packages/cli
npm run build
npm run dev
```

## License

MIT