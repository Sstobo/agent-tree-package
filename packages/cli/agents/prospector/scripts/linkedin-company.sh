#!/bin/bash

# LinkedIn Company Profile Enrichment Script
# Usage: ./linkedin-company.sh <linkedin_company_url>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <linkedin_company_url>"
    echo "Example: $0 https://www.linkedin.com/company/microsoft"
    exit 1
fi

COMPANY_URL="$1"
API_KEY="${SCRAPIN_API_KEY}"

if [ -z "$API_KEY" ]; then
    echo "Error: SCRAPIN_API_KEY environment variable not set"
    exit 1
fi

# URL encode the company URL
ENCODED_URL=$(echo -n "$COMPANY_URL" | jq -sRr @uri)

# Make the API request
curl -s --request GET \
  --url "https://api.scrapin.io/v1/enrichment/company?companyUrl=${ENCODED_URL}" \
  --header "X-API-Key: ${API_KEY}" \
  --header "Accept: application/json" | jq '.'