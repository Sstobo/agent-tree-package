# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Agent-tree is a CLI package that serves as "the shadcn/ui for AI agents" - providing copy-paste AI agents for Claude Code. This is a TypeScript npm package with zero runtime dependencies, focusing on simplicity and direct file copying.

## Development Commands

```bash
# Build the project
npm run build

# Development with watch mode
npm run dev

# Clean build artifacts
rm -rf dist
# or
npm run clean

# Test the CLI locally
node dist/index.js <agent-name>

# Test with npx (after building)
npx agent-tree <agent-name>
```

## Architecture

### Core Structure

- **packages/cli/src/index.ts** - Main CLI entry point with hardcoded agent registry
- **packages/cli/agents/** - Agent definitions with directory-based structure
- **packages/cli/commands/** - Claude Code command files (.md) for agent activation
- **packages/cli/agent-tree/** - Core configuration and coordination files

### Agent System

Each agent follows this pattern:

```text
agents/{agent-name}/
├── README.md           # Agent documentation
├── manuals/           # Reference docs
├── scripts/           # Utility scripts
├── tasks/             # Individual task definitions (.md)
└── workflows/         # Multi-step processes (.md)
```

### CLI Installation Process

1. User runs `npx agent-tree <agent-name>`
2. CLI copies agent files to `agent-tree/{agent-name}/`
3. Command file copied to `.claude/commands/{agent-name}.md`
4. Core config files (agent-tree-config.md, active-context.md) copied if missing
5. Agent activated with `/{agent-name}` in Claude Code

### Configuration System

- **agent-tree-config.md** - Global variables (SYSTEM_DOCS, ACTIVE_CONTEXT, WORK_LOAD, PRD)
- **active-context.md** - Agent coordination and shared state
- Variables use substitution in command files (e.g., `AGENT_NAME = "servitor"`)

## Available Agents

- **servitor** - Project management and agent coordination
- **convex-bot** - Convex database specialist  
- **pm** - Project management assistant
- **lil-fixit** - Quick fixes and small tasks
- **notion-bot** - Notion documentation specialist

## Multi-Agent Coordination

### Key Principles

- Agents never delete other agents' work
- Shared state through `active-context.md` (edited only in main branch)
- Git worktree support for isolated agent work
- YAML-based persona definitions in command files

### Agent Activation

Agents use YAML configuration in command files:

```yaml
agent:
  name: AGENT_NAME
  title: "descriptive title"
  icon: 🏃
activation-instructions:
  - Read agent-tree-config.md first
  - Follow startup sequence
commands:  # Use * prefix (e.g., *help, *status)
  - help: Show available commands
  - exit: Abandon persona
```

## Development Patterns

### TypeScript Configuration

- Target: ES2022 modules
- Strict mode enabled
- Declaration files generated
- Source maps included

### File Copying Strategy

- Direct `cpSync` operations (no complex bundling)
- Recursive directory copying for agent structures
- Graceful handling of missing files
- User confirmation before installation

### Command Integration

Commands are markdown files that define:
- Agent persona and behavior
- Startup sequences
- Available commands with * prefix
- Variable substitution system
- Dependencies (tasks/workflows)

## Testing Installation

Use the test-install-check directory to verify package installation works correctly across different environments.
