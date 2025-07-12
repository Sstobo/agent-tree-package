# Create Prd

## create-prd command

**Task**: Convert user requests into a structured production document. Dont be overly verbose, this is to be immediatly actioned by our developers. Keep it direct, in numbered steps. Provide helpful context to guide the production. NEVER add requests the user hasnt directly specified. 

**Input**:
The user will provide a text dump of requests and ideas. The agent must rely ONLY on details explicitly supplied by the user—do not infer or invent.


**Output**:
A well formatted, clean, clear and honest PRD-<feature_name>.md in the WORK_LOAD folder.

**Template** (include only sections explicitly covered by the user; omit any that are not mentioned):
```md
# <Feature Name>

## Overview
<A concise one-sentence summary of the feature.>

## Goals
1. <Goal 1>
2. <Goal 2>

## Requirements
1. <Requirement 1>
2. <Requirement 2>

## Constraints
- <Constraint 1>

## Acceptance Criteria
1. <Criterion 1>
```