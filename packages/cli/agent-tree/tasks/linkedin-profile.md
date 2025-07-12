# LinkedIn Profile Enrichment Task

## Purpose
Enrich a LinkedIn profile URL to extract detailed professional information including work history, skills, and contact details.

## Steps

1. **Get LinkedIn Profile URL**
   - Ask user for the LinkedIn profile URL if not provided
   - Validate it's a proper LinkedIn profile URL format

2. **Run Profile Enrichment**
   ```bash
   chmod +x agent-tree/prospector/scripts/linkedin-profile.sh
   agent-tree/prospector/scripts/linkedin-profile.sh "<profile_url>"
   ```

3. **Parse Results**
   - Extract key information:
     - Full name and headline
     - Current position and company
     - Location
     - Summary/About section
     - Work experience
     - Skills
     - Contact info (if available)

4. **Format Output**
   - Present data in a structured format
   - Highlight potential outreach angles
   - Note any missing information

## Success Criteria
- Profile data successfully retrieved
- Key professional information extracted
- Data formatted for easy use in outreach