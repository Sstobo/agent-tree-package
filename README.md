# Agent Tree 🌲

> The shadcn/ui for AI agents - copy-paste AI agents for Claude Code

Agent Tree is a distribution system for specialized AI agent configurations designed to work seamlessly with Claude Code. Just like shadcn/ui provides reusable UI components, Agent Tree provides reusable AI agent components that can be installed with a single command.

[![npm version](https://badge.fury.io/js/agent-tree.svg)](https://www.npmjs.com/package/agent-tree)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Quick Start

Install any agent with a single command:

```bash
npx agent-tree <agent-name>
```

Then activate the agent in Claude Code:

```bash
/{agent-name}
```

## Available Agents

| Agent | Purpose | Key Commands |
|-------|---------|-------------|
| **Servitor** | Project coordination & git management | `*swarm`, `*scan`, `*activate-worktree` |
| **Convex-Bot** | Convex database specialist | `*convex-scan`, `*test-driven`, `*testing-mode` |
| **Lil-Fixit** | Quick fixes & maintenance | `*grab-ticket`, `*get-busy`, `*scan` |
| **PM** | Project management & planning | `*create-prd`, `*qa-list`, `*status` |
| **Prospector** | Business intelligence & leads | `*go-prospectin`, `*find-leads`, `*extract-contact` |

## Workflows

1. **`*scan`** - Multi-perspective codebase analysis (3-10 named scientist agents)
2. **`*swarm`** - General parallel processing (configurable swarm sizes)
3. **`*test-driven`** - TDD enforcement with coverage (single focused agent)
4. **`*grab-ticket`** - QA ticket management (individual ticket claiming)
5. **`*go-prospectin`** - Comprehensive lead generation (multi-stage prospect research)
6. **`*get-busy`** - Codebase maintenance (parallel maintenance agents)
7. **`*activate-worktree`** - Create isolated git worktrees (single agent with unique branch)

## Tasks

1. **`*status`** - ASCII dashboard showing git status, active agents, system health
2. **`*list-work`** - Work overview with epic progress and blockers
3. **`*create-prd`** - Convert user requests into Product Requirements Documents
4. **`*qa-list`** - Create numbered QA documentation with structured entries
5. **`*hunter-gather`** - Deploy Hunter (bug tracking) and Gatherer (feature mapping) agents
6. **`*find-leads`** - Web search-based lead generation with company analysis
7. **`*extract-contact`** - Extract contact and business information from websites
8. **`*qualify-lead`** - Lead qualification and SWOT analysis
9. **`*linkedin-company`** - LinkedIn company profile enrichment
10. **`*linkedin-profile`** - Individual LinkedIn profile data extraction
11. **`*linkedin-job-search`** - LinkedIn job search with filters and analysis


## Usage Examples

### Development Workflow
```bash
# Install and coordinate development
npx agent-tree servitor
/servitor *scan medium          # Deploy 6-10 agents for analysis
/servitor *activate-worktree    # Create isolated development branch

# Handle maintenance
npx agent-tree lil-fixit
/lil-fixit *grab-ticket        # Claim and fix QA tickets
```

### Business Intelligence Workflow  
```bash
# Install and research leads
npx agent-tree prospector
/prospector *go-prospectin      # Comprehensive lead generation
/prospector *extract-contact https://company.com
```

### Project Management Workflow
```bash
# Install and organize project
npx agent-tree pm
/pm *create-prd                 # Create requirements document
/pm *qa-list                    # Generate QA checklist
/pm *status                     # Monitor project health
```

## Installation & Setup

**Prerequisites**: Node.js ≥18.0.0, Claude Code, Git

**What gets installed**:
```
.claude/commands/{agent}.md     # Agent command definition
agent-tree/                     # Complete agent ecosystem
├── workflows/                  # Multi-agent workflows  
├── tasks/                      # Individual task definitions
├── scripts/                    # Utility scripts
└── manuals/                    # Documentation & MCP guides
```

**Agent Coordination**: Agents use shared files (`ACTIVE_CONTEXT`, `WORK_LOAD`) to coordinate and prevent work overlap.


## License

MIT License - see [LICENSE](LICENSE) file for details.

## Version

Current version: **0.2.17**

---

**Agent Tree**: Bringing the component library model to AI agent development. Install, activate, and coordinate specialized AI agents for your development workflow.