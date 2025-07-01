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

## What It Does

Copies agent files to your project:
- `agent-tree/{agent-name}/` - Agent tasks, workflows, and docs
- `.claude/commands/{agent-name}.md` - Claude Code activation

Then use `/{agent-name}` in Claude Code to activate.

## Philosophy

Simple. Just copies files. No config. No dependencies. No complexity.

## License

MIT