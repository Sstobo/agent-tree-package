# Qualify Lead Task

Systematically evaluate potential leads to determine if they're worth pursuing.

## Instructions: 
Use your Web Search tools and run agents in parallel. Create a comprehensive table of leads. Save all files you create to  @WORK_LOAD/prospectin/qualified-leads-<project_name>/qualified-leads.md. Linkedin must be queried as well.

## Usage

I'll help you qualify leads by gathering and analyzing key information about the company.

Retrieve company data from Linkedin:

```bash
   chmod +x agent-tree/prospector/scripts/linkedin-company.sh
   agent-tree/prospector/scripts/linkedin-company.sh "<company_url>"
```

Retrieve data on an individual from Linkedin:

```bash
   chmod +x agent-tree/prospector/scripts/linkedin-profile.sh
   agent-tree/prospector/scripts/linkedin-profile.sh "<profile_url>"
```

## The Prospecto-bots
This task uses a variety of independant agents and agent swarms. They will be refered to as the 'Prospecto-bots'. They should each be given an olde english biblical amish sounding name to uniquely identify them. Name them "Prospecto-bot-<name>"

## Input
- Magnitude: # this is the amount of Prospecto-bots we will release when we spin up swarms. ALWAYS ask the user this if it is not supplied. Suggest not more than 5, but its up to them.
- **Company Name**: Name of the company to qualify
- **Company Website**: URL of their website
- **Your Criteria**: What makes a good lead for you

## Process

### 1. Company Verification
I'll check:
- Active website and online presence
- Business legitimacy
- Industry alignment
- Linkedin Company Profile

### 2. Information Gathering
Using WebSearch to find:
- Company size and employee count
- Recent news and updates
- Growth indicators
- Technology stack (if relevant)
- Current challenges or initiatives

### 3. Contact Discovery
Search for:
- Key decision makers
- Department heads
- Contact information
- LinkedIn profiles

## Qualification Criteria

I'll evaluate based on:

- **Company Fit**
  - Industry match
  - Company size
  - Geographic location
  - Business model

- **Opportunity Indicators**
  - Recent funding or growth
  - Hiring activity
  - Technology adoption
  - Pain points that match your solution

- **Accessibility**
  - Identifiable decision makers
  - Available contact information
  - Engagement channels

## Output

A qualification report with:
1. Company overview
2. Fit score (High/Medium/Low)
3. Key contacts found
4. Recommended next steps
5. Reasons for qualification decision
6. Lay it out nicely in @WORK_LOAD/prospectin/qualified-leads-<project_name>/qualified-leads.md in Markdown format. Detailed, precise, sourced and cited are your success metrics.
