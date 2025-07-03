# Extract Contact Task

Extract company information and find contact details.

## Commands

### Extract Company Info
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py --extract URL
```

### Find Contact Info
```bash
python3 ./agent-tree/prospector/scripts/tavily-prospect.py --contact "COMPANY_NAME" [--domain DOMAIN]
```

## Examples

### Extract from Company Website
```bash
# Get detailed company information
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --extract https://example-company.com
```

### Find Contact Information
```bash
# Search for contact info by company name
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --contact "Acme Corporation"

# Search with domain for better results
python3 ./agent-tree/prospector/scripts/tavily-prospect.py \
  --contact "Acme Corporation" \
  --domain acmecorp.com
```

## Tips

1. **Use the domain parameter** when searching for contacts to get more accurate results
2. **Extract first** to get company overview, then search for contacts
3. **Check multiple pages** - contact info might be on About, Contact, or Team pages

## Output

- Company description and details
- Email addresses found
- Phone numbers found
- Physical addresses (if available)
- Key personnel names (if found)