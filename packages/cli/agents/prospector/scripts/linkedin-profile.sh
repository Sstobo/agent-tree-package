#!/bin/bash

# LinkedIn Profile Enrichment Script
# Usage: ./linkedin-profile.sh <linkedin_url>

# Auto-load .env file from script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"
if [ -f "$ENV_FILE" ]; then
    export $(grep -v '^#' "$ENV_FILE" | xargs)
fi

if [ $# -eq 0 ]; then
    echo "Usage: $0 <linkedin_profile_url>"
    echo "Example: $0 https://www.linkedin.com/in/johndoe"
    exit 1
fi

LINKEDIN_URL="$1"
API_KEY="${SCRAPIN_API_KEY}"

if [ -z "$API_KEY" ]; then
    echo "Error: SCRAPIN_API_KEY environment variable not set"
    echo "Please add SCRAPIN_API_KEY to your .env file"
    exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Warning: jq is not installed. Install it for formatted output."
    echo "On macOS: brew install jq"
    echo ""
    # Use Python for URL encoding as fallback
    ENCODED_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$LINKEDIN_URL'))")
    
    # Make the API request without jq formatting
    curl -s --request GET \
      --url "https://api.scrapin.io/v1/enrichment/profile?linkedInUrl=${ENCODED_URL}" \
      --header "X-API-Key: ${API_KEY}" \
      --header "Accept: application/json"
else
    # URL encode the LinkedIn URL
    ENCODED_URL=$(echo -n "$LINKEDIN_URL" | jq -sRr @uri)
    
    # Make the API request with jq formatting
    curl -s --request GET \
      --url "https://api.scrapin.io/v1/enrichment/profile?linkedInUrl=${ENCODED_URL}" \
      --header "X-API-Key: ${API_KEY}" \
      --header "Accept: application/json" | jq '.'
fi