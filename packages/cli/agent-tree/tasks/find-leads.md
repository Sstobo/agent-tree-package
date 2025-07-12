# Find Leads Task

## Instructions: 
Use your Web Search tools and run agents in parallel. Create a comprehensive table of leads. Save all files you create to @WORK_LOAD/prospectin/leads-found-<project_name>/leads-found.csv

## Usage

I'll search the web for companies matching your criteria and compile a list of potential prospects.

## The Prospecto-bots
This workflow uses a variety of independant agents and agent swarms. They will be refered to as the 'Prospecto-bots'. They should each be given an olde english biblical amish sounding name to uniquely identify them. Name them "Prospecto-bot-<name>". Prospecto-bots MUST be explicitly told to record the url and snippet of ANY piece of information they wish to present as fact. If we do NOT do this, the report will be useless and we will lament.

## Input
- Magnitude: # this is the amount of Prospecto-bots we will release when we spin up swarms. ALWAYS ask the user this if it is not supplied. Suggest not more than 5, but its up to them.
- **Industry**: Business type or sector (required)
- **Location**: Geographic area (optional)
- **Company Size**: startup, SMB, or enterprise (optional)
- **Additional Terms**: Extra keywords to refine search (optional)

## Examples

Spin up and deploy a swarm of Prospecto-bots and execute your searches

### Find SaaS Startups
"Search for B2B SaaS startups in San Francisco Bay Area"

### Find Marketing Agencies
"Find digital marketing agencies in New York specializing in SEO and content marketing"

### Find Fintech Companies
"Search for fintech companies in London"

## Process

1. Use web search with your Prospecto-bots running in parallel 
2. Extract relevant information from the bots results.
3. Format the results with:
   - Company name and website
   - A DETAILED description, or what they do, and why they would be a good fit
   - How I could provide value for them
   - Location and size (if available)
   - Contact information (if found)
4. Lay it out nicely in @WORK_LOAD/prospectin/leads-found-<project_name>/leads-found.csv in table format. Detailed, precise, sourced and cited are your success metrics.
