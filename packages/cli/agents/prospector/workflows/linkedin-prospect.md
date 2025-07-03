# LinkedIn-Enhanced Prospecting Workflow

## Purpose
Comprehensive lead generation workflow that combines web search with LinkedIn data enrichment for deeper prospect intelligence.

## Steps

### 1. Initial Web Search
- Execute `find-leads` task to discover potential businesses
- Collect company names and websites from search results

### 2. LinkedIn Company Research
For each promising company found:
- Search for their LinkedIn company page
- Run `linkedin-company` task to get:
  - Company size and growth metrics
  - Industry focus and specialties
  - Recent activity and updates
  - Employee count trends

### 3. Identify Decision Makers
- Use `linkedin-job-search` with company filter to find:
  - Current job openings (hiring signals)
  - Department heads from job descriptions
  - Technology stack from requirements

### 4. Profile Enrichment
For key decision makers identified:
- Find their LinkedIn profiles
- Run `linkedin-profile` task to extract:
  - Professional background
  - Current responsibilities
  - Potential connection points

### 5. Qualify and Score Leads
- Execute `qualify-lead` task with enhanced data:
  - Company growth indicators
  - Active hiring (budget availability)
  - Technology alignment
  - Decision maker accessibility

### 6. Build Outreach Strategy
- Create personalized outreach angles based on:
  - Company's recent LinkedIn activity
  - Hiring needs and pain points
  - Decision maker's background
  - Common connections or interests

### 7. Generate Prospect Report
Format all findings into actionable prospect profiles:
```
Company: [Name]
LinkedIn: [URL]
Size: [Employees]
Growth: [Hiring activity]
Key Contact: [Name, Title]
LinkedIn: [Profile URL]
Outreach Angle: [Personalized approach]
Priority: [High/Medium/Low]
```

## Success Criteria
- Web search results enriched with LinkedIn data
- Decision makers identified with contact info
- Personalized outreach strategies developed
- Prospects scored by opportunity quality