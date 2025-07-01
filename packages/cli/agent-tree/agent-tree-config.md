# Agent Tree config

These variables will be applied to all agents unless specifically overwritten in the .config/command/<agent-name>.md file

## Variables

* All of your documentation about the functioning of the application. Technical specs, documentation, ui/ux direction etc.

SYSTEM_DOCS = "docs/system-patterns.md, docs/system-patterns.md, docs/frontend-patterns.md, docs/backend-patterns.md"```

* This is the shared file the agents will use to communicate and organize themselves.

ACTIVE_CONTEXT = "agent-tree/active-context.md"

* Workload is the upcoming work to do. It can be epics and stories, numbered lists, or any other prefered format.

WORK_LOAD = "docs/qa"

* Your core production document. MVP requirements, nice to haves, future plans etc.

PRD = "docs/PRD.md"
