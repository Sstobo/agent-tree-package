# Extract Contact Task

Extract company information and contact details from websites using Claude's web fetch capabilities. Use your Web Search tools and run agents in parallel. Create a comprehensive table of contacts. Save all files temporary files you create to @WORK_LOAD/prospectin/contacts-found-<job_name>.csv


## Usage

I'll fetch and analyze company websites to extract relevant business and contact information.

## The Prospecto-bots
This workflow uses a variety of independant agents and agent swarms. They will be refered to as the 'Prospecto-bots'. They should each be given an olde english biblical amish sounding name to uniquely identify them. Name them "Prospecto-bot-<name>". Prospecto-bots MUST be explicitly told to record the url and snippet of ANY piece of information they wish to present as fact. If we do NOT do this, the report will be useless and we will lament.

## Input
- Magnitude: # this is the amount of Prospecto-bots we will release when we spin up swarms. ALWAYS ask the user this if it is not supplied. Suggest not more than 5, but its up to them.
- **Company URL**: The website to analyze (required)
- **Company Name**: Name of the company (optional, helps with search)

## Examples

Spin up and deploy a swarm of Prospecto-bots and execute your searches

### Extract Company Profile
"Extract company information from https://example-company.com"

### Find Contact Information
"Find contact details for Acme Corp at acmecorp.com"

### Get Decision Maker Info
"Extract leadership team and contact info from https://startup.io"

## Process

1. Use web search with your Prospecto-bots running in parallel
2. Analyze the content to find:
   - Company description and services
   - Contact information (email, phone, address)
   - Key personnel and decision makers
   - Social media links
   - Recent news or updates
4. Lay it out nicely in @WORK_FLOW/prospectin/contacts-found-<project_name>/contacts-found.csv in table format.

## Information Extracted

- **Company Profile**
  - Business description
  - Products/services
  - Industry and specializations
  - Company size and location

- **Contact Details**
  - General contact emails
  - Phone numbers
  - Physical addresses
  - Contact forms

- **Key Personnel**
  - Leadership team
  - Department heads
  - LinkedIn profiles

## Output

Results include all found information organized in a clear format, in csv.