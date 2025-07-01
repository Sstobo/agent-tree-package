# Workflow for start-work

1. Load and READ the active-context at $ACTIVE_CONTEXT. 
2. EDIT $ACTIVE_CONTEXT and sign yourself in, and declare your active work.
3. Advice the user to commit their local work, and offer to commit it for them, then on confirmation from the user continue.
4. RUN the `start-work` task to create a work environment for yourself.
5. Upon successful completion of the `start-work` task, navigate to your worktree directory and plan, then solve the task.
6. Inform the user of your success.
7. EDIT $ACTIVE_CONTEXT with the updated state of the work item. Cleanup previous text about this item that is no longer valid.
8. RUN the `finish-work` task to finalize the cleanup of this completed work.