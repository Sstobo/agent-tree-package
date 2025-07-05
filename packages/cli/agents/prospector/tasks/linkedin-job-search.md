# LinkedIn Job Search Task

## Purpose
Search LinkedIn job postings to identify companies actively hiring and understand their needs, creating opportunities for business development.

## Steps

1. **Define Search Parameters**
   - Get search criteria from user:
     - Keywords (job titles, skills, technologies)
     - Location (city, region, remote)
     - Company URL (optional, for specific company jobs)

2. **Execute Job Search**
   ```bash
   chmod +x agent-tree/prospector/scripts/linkedin-job-search.sh
   agent-tree/prospector/scripts/linkedin-job-search.sh -k "<keywords>" -l "<location>" -p 1 -s 50
   ```

3. **Analyze Job Postings**
   - Extract hiring companies
   - Identify common requirements/pain points
   - Note technologies and skills in demand
   - Track hiring volume and urgency

4. **Identify Opportunities**
   - Companies with multiple openings (growth/expansion)
   - Repeated skill requirements (potential service needs)
   - New technology adoption signals
   - Department expansions

5. **Create Prospect List**
   - List companies with relevant hiring activity
   - Note specific needs based on job descriptions
   - Suggest outreach angles tied to hiring needs
   - Include hiring manager/department info when available

## Success Criteria
- Relevant job postings found
- Companies with active needs identified
- Actionable business development opportunities discovered