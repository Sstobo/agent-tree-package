# Prospector Agent

## Overview
Prospector is a business development agent that finds and qualifies potential clients using web search and LinkedIn data enrichment. It specializes in lead generation, company research, contact discovery, and professional network intelligence.

## Features
- **Business Search**: Find companies by industry, location, and size
- **Contact Discovery**: Extract email and phone information
- **Lead Qualification**: Systematic process for evaluating prospects
- **LinkedIn Integration**: Enrich prospects with LinkedIn profile and company data
- **Hiring Intelligence**: Identify companies actively hiring as growth signals
- **Export Options**: JSON, CSV, or Markdown formats

## Installation
```bash
npx agent-tree prospector
```

## Usage
Type `/prospector` in Claude Code to activate this agent.

## Commands
- `*help` - Show available commands
- `*find-leads` - Search for potential clients
- `*prospect-list` - Build a full prospect list
- `*linkedin-profile` - Enrich a LinkedIn profile with professional data
- `*linkedin-company` - Get comprehensive company intelligence from LinkedIn
- `*linkedin-jobs` - Find companies hiring (growth signals)
- `*linkedin-prospect` - LinkedIn-enhanced prospecting workflow
- `*exit` - Exit prospector mode

## Tasks
- **find-leads**: Search businesses by industry and location
- **extract-contact**: Get company and contact information
- **qualify-lead**: Evaluate prospect fit
- **linkedin-profile**: Extract professional background and contact info
- **linkedin-company**: Get company size, growth, and focus areas
- **linkedin-job-search**: Identify hiring patterns and needs

## Workflows
- **prospect-list**: Complete workflow for building qualified lead lists
- **linkedin-prospect**: Combines web search with LinkedIn enrichment

## Requirements
- Python 3.6+
- `tavily-python` package (install with: `pip install tavily-python`)
- `TAVILY_API_KEY` environment variable
- `SCRAPIN_API_KEY` environment variable (for LinkedIn features)
- `jq` command-line tool (for JSON processing)

**First Time Setup:**
```bash
pip install tavily-python
echo "TAVILY_API_KEY=your-api-key-here" >> .env
```

## Quick Start

### Find SaaS Startups
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "B2B SaaS" \
  --location "San Francisco" \
  --size startup
```

### Extract Company Info
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --extract https://example-company.com
```

### Export to CSV
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "fintech" \
  --format csv > leads.csv
```

### LinkedIn Profile Enrichment
```bash
./agent-tree/prospector/scripts/linkedin-profile.sh \
  "https://www.linkedin.com/in/johndoe"
```

### LinkedIn Company Intelligence
```bash
./agent-tree/prospector/scripts/linkedin-company.sh \
  "https://www.linkedin.com/company/acme-corp"
```

### Find Companies Hiring
```bash
./agent-tree/prospector/scripts/linkedin-job-search.sh \
  -k "software engineer" \
  -l "San Francisco" \
  -s 50
```