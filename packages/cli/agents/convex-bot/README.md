# Convex-Bot Agent

## Overview
Convex-Bot is a specialized agent for Convex real-time database development. It provides best practices, schema design guidance, and implementation patterns for building production-ready Convex applications.

## Features
- **Convex Schema Design**: Expert guidance on structuring your Convex database
- **Real-time Query Optimization**: Performance tips for real-time subscriptions
- **Authentication Patterns**: Secure authentication implementation strategies
- **Production-ready Implementations**: Battle-tested patterns and practices

## Installation
```bash
npx agent-tree add convex-bot
```

## Usage
Type `/convex-bot` in Claude Code to activate this agent.

## Commands
- `*help` - Show available commands
- `*start-work` - Begin working on Convex implementation
- `*finish-work` - Complete current Convex task
- `*list-work` - Show available Convex-related tasks

## Workflows
- **start-to-finish**: Complete Convex implementation workflow

## Files Structure
```
agent-tree/convex-bot/
├── manuals/
│   └── convex-docs.md
├── scripts/
│   └── list_work.sh
├── tasks/
│   ├── finish-work.md
│   └── start-work.md
└── workflows/
    └── start-to-finish.md
```

## Convex Best Practices
1. Always define schemas with proper TypeScript types
2. Use validators for runtime type safety
3. Implement proper error handling in mutations
4. Optimize queries with appropriate indexes
5. Use Convex Auth for authentication when possible

## Common Patterns
- **Real-time Subscriptions**: Use `useQuery` with proper caching
- **Optimistic Updates**: Implement with `useMutation` and local state
- **File Storage**: Utilize Convex file storage for media
- **Background Jobs**: Leverage scheduled functions for async work