# Qualify Lead Task

Quick process to qualify a potential lead before outreach.

## Process

### 1. Verify Company Website
```bash
# Extract company information
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --extract https://prospect-company.com \
  --format markdown > company_profile.md
```

### 2. Find Contact Information
```bash
# Search for contacts
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --contact "Company Name" \
  --domain company.com \
  --format markdown > contacts.md
```

### 3. Check Recent Activity
```bash
# Search for recent news or updates
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "Company Name news announcements" \
  --max-results 5 \
  --format markdown > recent_activity.md
```

## Qualification Checklist

Review the gathered information for:

- [ ] **Company Size**: Does it match your target market?
- [ ] **Industry Fit**: Is it in your target industry/vertical?
- [ ] **Decision Makers**: Can you identify key contacts?
- [ ] **Budget Indicators**: Any signs of funding/growth?
- [ ] **Pain Points**: Do they likely need your solution?
- [ ] **Timing**: Any recent changes or growth indicators?

## Quick Qualification Script

```bash
#!/bin/bash
# Save as qualify-lead.sh

COMPANY_NAME="$1"
DOMAIN="$2"
OUTPUT_DIR="leads/$COMPANY_NAME"

mkdir -p "$OUTPUT_DIR"

echo "Qualifying $COMPANY_NAME..."

# Extract company info
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --extract "https://$DOMAIN" > "$OUTPUT_DIR/profile.json"

# Find contacts
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --contact "$COMPANY_NAME" --domain "$DOMAIN" \
  --format markdown > "$OUTPUT_DIR/contacts.md"

# Check recent activity
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "$COMPANY_NAME news funding" \
  --max-results 3 > "$OUTPUT_DIR/recent.json"

echo "Lead qualification complete. Check $OUTPUT_DIR/"
```

## Next Steps

Based on qualification:
- **Qualified**: Move to outreach list
- **Needs Research**: Gather more specific information
- **Not Qualified**: Archive with reason