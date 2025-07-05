# Swarm Deployment Workflow

## Overview
Custom swarm deployment workflow for specialized analysis needs. This workflow allows dynamic configuration of agent swarms based on specific requirements.

## Configuration Parameters

### 1. Swarm Size
- **Small** (3-5 agents): Quick targeted analysis
- **Medium** (6-10 agents): Balanced coverage
- **Large** (10+ agents): Comprehensive deep dive

### 2. Deployment Strategy
- **Parallel**: All agents work simultaneously
- **Sequential**: Agents build on previous findings
- **Hybrid**: Initial parallel scan, then targeted sequential

## Workflow Steps

### Step 1: Requirements Gathering
1. Define analysis scope and boundaries
2. Identify specific concerns or hypotheses
3. Set success criteria and deliverables
4. Determine time constraints

### Step 2: Swarm Configuration
Based on requirements, configure:
```
1. Delegate a single agent for all of the other agents to report into. This agent will be the Queen. 
2. The Number of agents per focus area
3. The scripts or tools each agent will require to complete their tasks.
2. Agent specializations and skills
3. Communication patterns between agents: The Agents must report in to the queen before and after a task. The Queen will do all work assignment and completion checks.

```

### Step 3: Dynamic Deployment

Deploy the Queen to oversee:

1. **Initial Wave**
   - Deploy reconnaissance agents
   - Establish analysis baseline
   - Identify areas requiring deep dive

2. **Adaptive Wave**
   - Based on initial findings
   - Deploy specialized agents
   - Focus on high-value targets

3. **Synthesis Wave**
   - Pattern recognition agents
   - Cross-reference findings
   - Generate unified report

### Step 4: Progressive Refinement (The Queens Job)
- Monitor agent progress
- Redirect agents as needed
- Deploy additional agents for gaps
- Ensure comprehensive coverage
- Once the Queen is pleased, aggregate the data into a deep thoughtful MD file.

## Custom Swarm Templates ( show these to the user in a numbered list for easy selection on load )

### 1. Rapid Security Scan
```
- 1 Master Planner / Delegator
- 2 Auth/Session agents
- 2 Input validation agents
- 1 Dependency scanner
- 1 Configuration auditor
```

### 2. Performance Deep Dive
```
- 1 Master Planner / Delegator
- 2 Database query analysts
- 2 Frontend performance agents
- 2 API response time checkers
- 1 Memory/resource profiler
```

### 3. Refactoring Assistant
```
- 1 Master Planner / Delegator
- 2 Code smell detectors
- 2 Duplicate code finders
- 2 Complexity analyzers
- 2 Test coverage mappers
```

## Output Customization
- Real-time progress updates
- Interim findings reports
- Final consolidated analysis
- Action item prioritization
- Implementation recommendations