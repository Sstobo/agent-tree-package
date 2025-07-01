#!/bin/bash

# Enhanced list_work.sh with better formatting and information
set -e

# Color codes and emojis
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SUCCESS="✅"
INFO="ℹ️"
BRANCH="🌿"

echo -e "${INFO} Work Session Status"
echo "===================="

# Show current branch
current_branch=$(git branch --show-current)
echo -e "${BRANCH} Current branch: ${GREEN}$current_branch${NC}"

# Show active context
if [ -f "agent-tree/active-context.md" ]; then
    active_work=$(cat agent-tree/active-context.md)
    if [ -n "$active_work" ]; then
        echo -e "${INFO} Active work: ${YELLOW}$active_work${NC}"
    else
        echo -e "${INFO} No active work"
    fi
fi

echo ""

# List work branches
echo "Work Branches:"
echo "-------------"
work_branches=$(git branch --list "work/*" 2>/dev/null || echo "")
if [ -n "$work_branches" ]; then
    echo "$work_branches" | while read -r branch; do
        branch=$(echo "$branch" | sed 's/^[ *]*//')
        if [ "$branch" = "$current_branch" ]; then
            echo -e "${SUCCESS} $branch (current)"
        else
            echo -e "  $branch"
        fi
    done
else
    echo "  No work branches found"
fi

echo ""

# List work logs
echo "Work Logs:"
echo "---------"
if ls agent-tree/worktrees/work-*-log.md 1> /dev/null 2>&1; then
    for log_file in agent-tree/worktrees/work-*-log.md; do
        if [ -f "$log_file" ]; then
            ticket=$(basename "$log_file" | sed 's/work-//' | sed 's/-log.md$//')
            echo -e "  ${INFO} $ticket: $log_file"
        fi
    done
else
    echo "  No work logs found"
fi

echo ""
echo "Commands:"
echo "  start_work.sh <TICKET> <AGENT> - Start new work session"
echo "  finish_work.sh                 - Finish current work session"
echo "  list_work.sh                   - Show this status" 