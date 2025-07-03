# Find Leads Task

Search for potential business clients in specific industries and locations.

## Command

```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py --industry "INDUSTRY" [options]
```

## Options

- `--industry` - Industry or business type (required)
- `--location` - Geographic location (city, state, country)
- `--size` - Company size: startup, SMB, or enterprise
- `--terms` - Additional search terms
- `--max-results` - Maximum results (default: 10)
- `--format` - Output format: json, csv, or markdown (default: markdown)

## Examples

### SaaS Startups in Bay Area
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "SaaS B2B software" \
  --location "San Francisco Bay Area" \
  --size startup \
  --max-results 20
```

### Marketing Agencies
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "digital marketing agency" \
  --location "New York" \
  --terms "SEO" "content marketing"
```

### Export as CSV
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --industry "fintech" \
  --location "London" \
  --format csv > fintech_prospects.csv
```

## Output

Returns a list of potential prospects with:
- Company name and website
- Brief description
- Relevance score
- Potential contact information (if found)