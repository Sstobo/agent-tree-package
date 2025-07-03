# Prospect List Workflow

Build a qualified list of business prospects for outreach.

## Overview

This workflow helps you systematically find, extract, and qualify business leads.

## Phase 1: Define Target Market

Before starting, clearly define:
- **Industry/Niche**: Specific business type
- **Location**: Geographic focus
- **Company Size**: Startup, SMB, or Enterprise
- **Ideal Customer Profile**: Key characteristics

## Phase 2: Initial Search

### Find Prospects
```bash
# Example: Find B2B SaaS companies
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "B2B SaaS software" \
  --location "United States" \
  --size startup \
  --terms "series A" "cloud" \
  --max-results 20 \
  --format markdown > initial_prospects.md
```

### Review Results
- Check relevance scores
- Verify companies match criteria
- Note promising leads

## Phase 3: Gather Details

For each promising lead:

### 1. Extract Company Info
```bash
# Get detailed information
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --extract https://company-website.com \
  --format json > companies/company_name.json
```

### 2. Find Contacts
```bash
# Search for decision makers
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --contact "Company Name" \
  --domain company.com \
  --format markdown > companies/company_name_contacts.md
```

## Phase 4: Build Prospect Database

### Create CSV for CRM Import
```bash
# Search and export directly to CSV
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "YOUR_INDUSTRY" \
  --location "YOUR_LOCATION" \
  --format csv > prospect_list.csv
```

### Organize Information
```
prospects/
├── qualified/
│   ├── company1/
│   │   ├── profile.json
│   │   ├── contacts.md
│   │   └── notes.md
│   └── company2/
├── needs_research/
└── not_qualified/
```

## Phase 5: Prioritize Outreach

Rank prospects by:
1. **Fit Score**: How well they match ICP
2. **Contact Quality**: Decision maker access
3. **Timing**: Recent growth/changes
4. **Budget Signals**: Funding, hiring, expansion

## Example: Finding Marketing Agencies

```bash
# Step 1: Initial search
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "digital marketing agency" \
  --location "Los Angeles" \
  --terms "ecommerce" "Shopify" \
  --max-results 30 \
  --format markdown > agencies.md

# Step 2: For each promising agency
AGENCY_URL="https://promising-agency.com"
AGENCY_NAME="Promising Agency"

# Extract details
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --extract "$AGENCY_URL" > "$AGENCY_NAME/profile.json"

# Find contacts
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --contact "$AGENCY_NAME" \
  --domain "promising-agency.com" > "$AGENCY_NAME/contacts.json"

# Step 3: Export qualified leads
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "digital marketing agency Los Angeles" \
  --format csv > qualified_agencies.csv
```

## Tips for Success

1. **Start Narrow**: Better to have 20 qualified leads than 200 unqualified
2. **Verify Websites**: Ensure companies are active and legitimate
3. **Look for Triggers**: Recent funding, expansion, new hires
4. **Track Everything**: Keep notes on why leads qualified/didn't qualify
5. **Iterate**: Refine search terms based on best results

## Next Steps

After building your list:
1. Import to CRM
2. Set up outreach sequences
3. Personalize messaging based on gathered intel
4. Track response rates
5. Refine targeting based on results