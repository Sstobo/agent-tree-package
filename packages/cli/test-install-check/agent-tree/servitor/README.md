# Servitor Agent

## Overview
Servitor is a project management and agent coordination specialist designed for Claude Code. It manages git state, project health, and multi-agent workflows to keep your development organized and efficient.

## Features
- **Git Worktree Management**: Creates and manages isolated workspaces for different agents
- **Agent Task Coordination**: Orchestrates multiple agents working on the same project
- **Project Health Monitoring**: Tracks project status and identifies issues
- **Automated Workflow Execution**: Runs predefined workflows for common tasks

## Installation
```bash
npx agent-tree add servitor
```

## Usage
Type `/servitor` in Claude Code to activate this agent.

## Commands
- `*help` - Show available commands
- `*health` - Check project health status
- `*status` - Show current project status
- `*start-work` - Begin a new work session
- `*finish-work` - Complete current work session
- `*list-work` - List all active work items

## Workflows
- **health**: Comprehensive project health check
- **start-to-finish**: Complete workflow from task selection to completion

## Files Structure
```
agent-tree/servitor/
├── manuals/
│   └── convex-docs.md
├── scripts/
├── tasks/
│   ├── finish-work.md
│   ├── list-work.md
│   ├── start-work.md
│   └── status.md
└── workflows/
    ├── health.md
    └── start-to-finish.md
```

## Best Practices
1. Always run `*health` when starting a new session
2. Use `*start-work` to properly initialize agent workspaces
3. Complete work with `*finish-work` to ensure clean state
4. Coordinate multiple agents using the active-context.md file