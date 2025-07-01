# Lil-Fixit Agent

## Overview
Lil-Fixit is a helpful, cheerful bot that specializes in completing todo items and QA lists. It runs in parallel with other agents, making targeted fixes for small items while maintaining coordination through shared documentation.

## Features
- **Parallel Task Execution**: Works alongside other agents without conflicts
- **Todo Management**: Efficiently tracks and completes todo items
- **QA List Processing**: Systematically works through quality assurance tasks
- **Context Maintenance**: Updates shared documentation for agent coordination

## Installation
```bash
npx agent-tree add lil-fixit
```

## Usage
Type `/lil-fixit` in Claude Code to activate this agent.

## Commands
- `*help` - Show available commands
- `*start-to-finish` - Execute complete workflow
- `*status` - Check current status
- `*list-work` - List available work items
- `*exit` - Exit lil-fixit mode

## Workflows
- **start-to-finish**: Complete workflow for task execution
- **health**: Check agent and project health

## Files Structure
```
agent-tree/lil-fixit/
├── manuals/
│   └── convex-docs.md
├── scripts/
│   ├── current-date.sh
│   └── random-name.sh
├── tasks/
│   ├── finish-work.md
│   ├── list-work.md
│   ├── report-in.md
│   ├── start-work.md
│   └── status.md
└── workflows/
    ├── health.md
    └── start-to-finish.md
```

## Unique Features
- **Random Name Generation**: Each instance gets a unique, fun name
- **Cheerful Personality**: Maintains positive, task-oriented communication
- **Non-Destructive**: Never deletes other agents' work or comments

## Best Practices
1. Always update active-context.md in the main branch
2. Maintain clear communication about task progress
3. Work in parallel without blocking other agents
4. Focus on small, targeted fixes
5. Keep the work load document updated