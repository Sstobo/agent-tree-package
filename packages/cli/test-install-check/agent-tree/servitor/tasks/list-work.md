# 📋 List Work Task

## AI Agent Prompt: Quick Work Overview

Analyze the project status and provide a **compact work dashboard** by reading:

1. **$PRD** (`docs/PRD.md`) - Product requirements and epics
2. **$ACTIVE_CONTEXT** (`agent-tree/active-context.md`) - Recent completions  
3. **$WORK_LOAD** (`docs/epics/`) - Current epic status

### 📊 **Output Format**

```
# 📊 WORK OVERVIEW
*Generated: [timestamp]*

## 🎯 STATUS
- **Health:** [Grade] | **Agents:** [Number] active
- **Just Completed:** [Recent wins]

## 🔥 NEXT (1-2 weeks)
1. [Task] - [Epic] - [Days]
2. [Task] - [Epic] - [Days]

## 🎯 UPCOMING (2-4 weeks)  
1. [Task] - [Epic] - [Days]
2. [Task] - [Epic] - [Days]

## ✅ DONE
- [Achievement] - [Impact]

## ⚠️ BLOCKERS
- [Issue] - [Action needed]

## 📋 EPIC PROGRESS
Epic 1: [Name] ████████░░ 80% (4/5 stories)
Epic 2: [Name] ██░░░░░░░░ 20% (1/5 stories)

## 🎯 DO NEXT
1. [Specific action]
2. [Specific action]
```

### 🔧 **Guidelines**

- **Be specific:** Include epic names and story counts
- **Be brief:** Each section under 30 seconds to read
- **Be actionable:** Focus on what to do next
- **Cross-reference:** Connect PRD epics to current work

### 🎪 **Context**

- Next.js 15 + Convex starter kit project
- Recent Convex best practices review completed (A- grade)
- 4 epics with 12 total stories
- Multiple AI agents working

---

**Execute this analysis and provide the work overview dashboard.**
