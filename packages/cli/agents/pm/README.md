# PM (Project Manager) Agent

## Overview
PM is a comprehensive project management assistant for Claude Code. It handles task tracking, documentation management, sprint planning, and team coordination to keep your projects organized and on track.

## Features
- **Task Prioritization**: Intelligent task ordering based on dependencies and importance
- **Sprint Planning**: Organize work into manageable sprints
- **Documentation Management**: Maintain project docs and technical specifications
- **Team Communication**: Coordinate between multiple developers and agents

## Installation
```bash
npx agent-tree add pm
```

## Usage
Type `/pm` in Claude Code to activate this agent.

## Commands
- `*help` - Show available commands
- `*plan-sprint` - Plan the next sprint
- `*prioritize` - Prioritize current tasks
- `*status` - Show project status
- `*create-doc` - Create project documentation
- `*update-roadmap` - Update project roadmap

## Workflows
- **sprint-planning**: Complete sprint planning workflow
- **daily-standup**: Run daily standup process
- **retrospective**: Conduct sprint retrospective

## Files Structure
```
agent-tree/pm/
├── manuals/
│   └── project-management.md
├── scripts/
│   └── generate-report.sh
├── tasks/
│   ├── plan-sprint.md
│   ├── prioritize.md
│   ├── status.md
│   ├── create-doc.md
│   └── update-roadmap.md
└── workflows/
    ├── sprint-planning.md
    ├── daily-standup.md
    └── retrospective.md
```

## Project Management Best Practices
1. Regular sprint planning and retrospectives
2. Clear task prioritization based on business value
3. Maintain up-to-date project documentation
4. Track blockers and dependencies
5. Communicate progress regularly

## Templates
- Sprint planning template
- Task template with acceptance criteria
- Documentation templates (PRD, Technical Spec, etc.)
- Retrospective template