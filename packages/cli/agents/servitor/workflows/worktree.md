# Workflow for worktree

## worktree command

# Input
- Subject of work. What will this worktree be containing? What work are we doing here?
Be sure to request this from the user if not included in the workflow call.

1. Load and READ the active-context at ACTIVE_CONTEXT. 
2. EDIT ACTIVE_CONTEXT and sign yourself in, and declare your active work.
3. Advice the user to commit their local work, and offer to commit it for them, then on confirmation from the user continue.

4. Start Work / Create Worktree 

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

5. Upon successful completion of the Start Work / Create Worktree process, navigate to your worktree directory and plan, then solve the task.

6. Inform the user of your success.

7. EDIT ACTIVE_CONTEXT with the updated state of the work item. Cleanup previous text about this item that is no longer valid.

8. Finish Work / Remove Worktree

You have completed your coding task as an agent in a Git worktree.  
Follow these steps to safely publish your results and clean up your worktree:

1. Run all required tests and linting in your worktree directory. Ensure the code is production-ready.

2. Push your agent branch to the remote repository:
   git push -u origin "agent/$AGENT_ID"

3. Output a summary JSON so the supervisor can track your result, for example:
   {"branch":"agent/$AGENT_ID","commits":$(git rev-list --count HEAD)}

4. When your work is merged or your branch is no longer needed, remove your worktree:
   git -C "$REPO_ROOT" worktree remove "$TREE_DIR"

5. If your agent branch is no longer needed, delete it from the main repository:
   git -C "$REPO_ROOT" branch -D "agent/$AGENT_ID"

6. (Optional, supervisor step) Prune any stale worktree metadata periodically:
   git -C "$REPO_ROOT" worktree prune --expire 1.week.ago

Never delete the worktree directory manually; always use the git worktree remove command to keep the repository safe and consistent.


