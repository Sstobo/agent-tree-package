# LinkedIn Company Enrichment Task

## Purpose
Extract comprehensive company data from LinkedIn company pages to understand potential clients and their business context.

## Steps

1. **Get Company LinkedIn URL**
   - Request LinkedIn company page URL from user
   - Validate URL format (should be linkedin.com/company/...)

2. **Enrich Company Data**
   ```bash
   chmod +x agent-tree/prospector/scripts/linkedin-company.sh
   agent-tree/prospector/scripts/linkedin-company.sh "<company_url>"
   ```

3. **Extract Key Information**
   - Company name and tagline
   - Industry and company size
   - Headquarters location
   - Description and specialties
   - Website URL
   - Employee count and growth
   - Recent updates/posts

4. **Analyze Business Potential**
   - Identify company's focus areas
   - Note potential pain points from description
   - Check for recent expansion or changes
   - Assess fit with user's offering

5. **Format Results**
   - Create company profile summary
   - List key decision-maker titles to target
   - Suggest outreach angles based on company focus

## Success Criteria
- Company data successfully retrieved
- Business context understood
- Actionable insights for outreach provided