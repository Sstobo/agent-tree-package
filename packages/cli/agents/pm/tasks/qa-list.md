# QA List

## qa-list command

**Task**: Convert user requests into structured QA documentation

**Process**:
1. **Analyze** user requests and notes thoroughly
2. **Search** codebase for relevant context  
3. **Create** numbered QA file in WORK_LOAD folder

**File Naming**: `qa-<YYYY-MM-DD>-<agent-name>-<status>.md`
- Status options: `queue`, `in-process`, `paused`, `review`, `complete`

**Entry Format** (for each request):
```
## [Number]. [Brief Title]
- **What**: Specific requirement/request
- **Why**: Business justification/user need  
- **Where**: Affected files/components/areas
- **How**: Implementation approach/steps
- **Context**: Relevant codebase insights (from Serena scan)
```

**Rules**:
- Document ONLY what user explicitly requested
- Keep entries concise but complete
- Include all critical technical details
- No feature additions or interpretations
