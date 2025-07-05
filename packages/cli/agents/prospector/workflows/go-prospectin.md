# Go Prospectin Workflow

## Instructions: 
Use your Web Search tools. Use the Linkedin retrieval functions in parallel to your multi agent web searches. Press the user for the .env in /scripts containing their SCRAPIN_API_KEY. Save all files files you create to @WORK_LOAD/prospectin/gone-prospectin-<project_name>/<file_name>

## The Prospecto-bots
This workflow uses a variety of independant agents and agent swarms. They will be refered to as the 'Prospecto-bots'. They should each be given an olde english biblical amish sounding name to uniquely identify them. Name them "Prospecto-bot-<name>". Prospecto-bots MUST be explicitly told to record the url and snippet of any statement they wish to present as fact. If we do NOT do this, the report will be useless and we will lament.

## Input
- Magnitude: # this is the amount of Prospecto-bots we will release when we spin up swarms. ALWAYS ask the user this if it is not supplied. Suggest not more than 5, but its up to them.
- Industry focus:
- Geography:
- Revenue range:
- Size range:

## Steps

### 1. Lead Data Acquisition
Spin up and deploy a swarm of Prospecto-bots and execute `find-leads` task to scrape LinkedIn and web sources for potential companies. Prospect from different vectors, with each agent adding a new angle.

### 2. Initial Company Qualification
Apply systematic filters to qualifying leads:
- **Industry Filter**:
- **Geography Filter**: 
- **Revenue Filter**: 
- **Size Filter**: 

### 3. Key-Contact Identification
Spin up and deploy a swarm of Prospecto-bots and execute  `extract-contact` task for qualified companies to gather:
- Chief Marketing Officer / VP Marketing / Director Marketing / Marketing Manager
- President / Vice President
- Senior Operations or Senior Sales personnel (when present)
- Create a document in your Work Space "identified-contacts.csv" with this data.
- Cite facts with the url of the information, and a snippet of the text in context

### 4. Website-Activity Assessment
Spin up and deploy a swarm of Prospecto-bots and Analyze digital presence markers:
- Record total pages indexed on company website
- Record frequency of website updates (blog posts, product pages, content changes)
- Flag high page counts and frequent updates as active marketing signals
- Create a document in your Work Space "website-activity.md" with the Prospecto-bots final results, synthesized by you.
- Cite facts with the url of the information, and a snippet of the text in context

### 5. Government-Tender Engagement Check
Spin up and deploy a swarm of Prospecto-bots and Research public procurement participation:
- Gather data on government tender participation
- Note frequency of tender wins
- Document product lines regularly submitted
- Create a document in your Work Space "procurement.md"  with the Prospecto-bots final results, synthesized by you.
-  Cite facts with the url of the information, and a snippet of the text in context

### 6. Target-Customer Profiling
Spin up and deploy a swarm of Prospecto-bots and Derive customer intelligence from company data:
- Identify primary customer types from brands represented
- Document product lines manufactured
- Store customer descriptors in lead sheet
- Create a document in your Work Space "customer-intelligence.md"  with the Prospecto-bots final results, synthesized by you.
- Cite facts with the url of the information, and a snippet of the text in context

### 7. SWOT Roll-Up
Spin up and deploy a swarm of and execute `qualify-lead` to prepare SWOT analysis for each company:
- **Strengths**: Active marketing signals, market position
- **Weaknesses**: Low web activity, resource constraints
- **Opportunities**: Growth inflection points, market gaps
- **Tactics**: Specific areas where 2.12 Marketing can assist
- Create a document in your Work Space "swot-rollup.md"  with the Prospecto-bots final results, synthesized by you.
- Cite facts with the url of the information, and a snippet of the text in context

### 8. User check in
Pause and wait for the user. Suggest turning on their most powerful LLM model, then confinue with the final report.

## Output

### Final Report Generation
1. [REVIEW STAGE] Load and Read ALL of the documents produced in the @WORK_LOAD/prospectin/gone-prospectin-<project_name>/
2. Load and Read the PROSPECTIN_TEMPLATE from `@agent-tree/prospector/templates/PROSPECTIN_TEMPLATE.md`
2. Aggregate and analyze all data collected by the agent swarm:
   - Cross-reference findings from multiple agents
   - Verify data points across sources
   - Calculate scoring metrics for each company
3. Think Deeply, and then Fill out EVERY section of the PROSPECTIN_TEMPLATE with:
   - **Citations for every fact** - Include source and relevant snippet
   - **Specific data points** - No generalizations or assumptions  
   - **Your deep insights** - Connect the dots, educate and inform
   - **Dates for all information** - When was data collected/verified
   - **Confidence levels** - Note when data is estimated vs confirmed
   - Write the final report to: @WORK_LOAD/prospectin/gone-prospectin-<project_name>prospectin-[industry]-[date]-completed.docx`

### Quality Requirements
- **Factual Accuracy**: Every statement must be verifiable with cited source. No sales speak, just exactly what was requested.
- **Professional Tone**: Data-driven insights, no sales hype or speculation
- **Actionable Intelligence**: Specific recommendations based on evidence
- **Complete Coverage**: All template sections must be thoroughly populated
- **Detailed Analysis**: IMPORTANT: We want you to be opinionated and draw conclusions, and uncover new information. Just be sure to cite your sources when claiming facts.

### Success Metrics
Your report will be evaluated on:
1. Completeness - All template sections filled with relevant data
2. Accuracy - Facts match sources, calculations are correct
3. Actionability - Recommendations are specific and implementable
4. Citation Quality - Every claim is supported with source + snippet
5. Deep and thorough analysis.

IMPORTANT!: Use your "Web Search" tool, NOT "Fetch". Tell the Prospecto-bots this as well. No FETCH, yes Web Search.