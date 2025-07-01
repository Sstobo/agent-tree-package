# Finish Work / Remove Worktree

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