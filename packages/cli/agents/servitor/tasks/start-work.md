# Start Work / Create Worktree 

You are about to begin a coding task as an autonomous agent in a shared Git repository.  
Follow these steps to set up a clean, isolated worktree for your work, so that you do not interfere with other agents:

1. Ensure your current working tree in the main repository is clean (no uncommitted or staged changes):
   git -C "$REPO_ROOT" diff --quiet --exit-code || { echo "Working tree not clean"; exit 99; }

2. Fetch the latest changes from all remotes and prune any deleted branches:
   git -C "$REPO_ROOT" fetch --all --prune

3. Generate a unique agent ID for this session (for example: AGENT_ID="$(date +%s)-${RANDOM}").
   Add the agents unique name to the $AGENT_ID (for example: $AGENT_ID_convex_bot_thomas)

4. Create a new directory for your worktree:
   TREE_DIR="$REPO_ROOT/agent-tree/worktrees/$AGENT_ID"
   mkdir -p "$(dirname "$TREE_DIR")"

5. Add a new worktree and branch for your agent, based on the latest main branch:
   git -C "$REPO_ROOT" worktree add -B "agent/$AGENT_ID" "$TREE_DIR" main

6. Confirm your new worktree was created:
   git -C "$REPO_ROOT" worktree list | grep "$AGENT_ID"

7. Change directory to your new worktree:
   cd "$TREE_DIR"

From this point, do all your work (editing, committing, testing) **only inside this worktree and branch** ("agent/$AGENT_ID").  
Do not modify or delete any other directories, branches, or worktrees.  
At the end of your task, follow the separate FINISH-WORK instructions.
