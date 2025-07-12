# 🤖 AI Agent Status Dashboard

## Quick Status Check Steps

1. **Check Git Status** - Primary focus: Run `git status` for pending changes
2. **Check Active Context** - Review `agent-tree/active-context.md`
3. **Scan Git Branches** - Run `git branch -a` to see all agent branches
4. **Monitor Worktrees** - Check `agent-tree/worktrees/` for active sessions
5. **Validate Agent States** - Check each agent's task completion status
6. **Assess Git Health** - Look for conflicts, uncommitted work, or merge needs

---

CREATE AN ASCII CHART JUST LIKE THE FOLLOWING:

``` (example of visual layout), you MUST use the real data.
╭─────────────────────────────────────────────────────────────────╮
│                    🤖 AI AGENT CONTROL CENTER                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  MAIN BRANCH:     [🟢] main (ahead by 5 commits)              │
│  GIT STATUS:      [🟡] Uncommitted changes present             │
│  ACTIVE AGENTS:   [🟢] 1 agent working                         │
│  WORKTREES:       [🟢] 1 active worktree                       │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                        ACTIVE AGENTS                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  🤖 NEO (Convex Bot)                                           │
│     Status: [🟢] ACTIVE - Task Completed                       │
│     Focus:  Convex Best Practices Implementation               │
│     Branch: agent/1751222900-1668-convex-bot-neo              │
│     Started: 2025-06-29                                        │
│     Progress: ████████████████████████████████ 100%           │
│                                                                 │
│  🔧 SERVITOR                                                   │
│     Status: [🟡] STANDBY - Monitoring                          │
│     Focus:  Project Status & Coordination                      │
│     Branch: main                                               │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                        WORKTREE STATUS                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  📁 1751222900-1668-convex-bot-neo/                           │
│     Agent: Neo (Convex Bot)                                    │
│     Status: [🟢] COMPLETED                                     │
│     Health: All TypeScript & Linting Passed                   │
│     Ready for: Merge/Cleanup                                   │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                      SYSTEM HEALTH CHECK                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  🟢 TypeScript Compilation: PASSED                             │
│  🟢 ESLint Validation: PASSED                                  │
│  🟢 Convex Functions: OPTIMIZED                                │
│  🟡 Git Status: 8 modified/deleted files uncommitted          │
│  🟢 Dependencies: UP TO DATE                                   │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                     ATTENTION REQUIRED                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  🟡 CLEANUP NEEDED:                                            │
│     • 8 files need git add/commit/restore                     │
│     • Completed worktree ready for merge                       │
│     • Deleted lil-fixit agent files need cleanup              │
│                                                                 │
│  🟢 NO CRITICAL ISSUES                                         │
│                                                                 │
╰─────────────────────────────────────────────────────────────────╯
```

Run the git checks and then create a dashboard for the user.