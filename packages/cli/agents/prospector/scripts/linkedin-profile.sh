#!/bin/bash

# LinkedIn Profile Enrichment Script
# Usage: ./linkedin-profile.sh <linkedin_url>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <linkedin_profile_url>"
    echo "Example: $0 https://www.linkedin.com/in/johndoe"
    exit 1
fi

LINKEDIN_URL="$1"
API_KEY="${SCRAPIN_API_KEY}"

if [ -z "$API_KEY" ]; then
    echo "Error: SCRAPIN_API_KEY environment variable not set"
    exit 1
fi

# URL encode the LinkedIn URL
ENCODED_URL=$(echo -n "$LINKEDIN_URL" | jq -sRr @uri)

# Make the API request
curl -s --request GET \
  --url "https://api.scrapin.io/v1/enrichment/profile?profileUrl=${ENCODED_URL}" \
  --header "X-API-Key: ${API_KEY}" \
  --header "Accept: application/json" | jq '.'