#!/bin/bash

# LinkedIn Job Search Script
# Usage: ./linkedin-job-search.sh [-k keywords] [-l location] [-c company_url] [-p page] [-s size]

# Auto-load .env file from script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"
if [ -f "$ENV_FILE" ]; then
    export $(grep -v '^#' "$ENV_FILE" | xargs)
fi

# Default values
KEYWORDS=""
LOCATION=""
COMPANY_URL=""
PAGE=1
SIZE=50

# Parse command line arguments
while getopts "k:l:c:p:s:" opt; do
    case $opt in
        k) KEYWORDS="$OPTARG";;
        l) LOCATION="$OPTARG";;
        c) COMPANY_URL="$OPTARG";;
        p) PAGE="$OPTARG";;
        s) SIZE="$OPTARG";;
        \?) echo "Invalid option -$OPTARG" >&2; exit 1;;
    esac
done

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
    
    # Build query string using Python for URL encoding
    QUERY=""
    if [ -n "$KEYWORDS" ]; then
        ENCODED_KEYWORDS=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$KEYWORDS'))")
        QUERY="${QUERY}&keywords=${ENCODED_KEYWORDS}"
    fi
    if [ -n "$LOCATION" ]; then
        ENCODED_LOCATION=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$LOCATION'))")
        QUERY="${QUERY}&location=${ENCODED_LOCATION}"
    fi
    if [ -n "$COMPANY_URL" ]; then
        ENCODED_COMPANY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$COMPANY_URL'))")
        QUERY="${QUERY}&companyUrl=${ENCODED_COMPANY}"
    fi
    QUERY="${QUERY}&page=${PAGE}&size=${SIZE}"
    
    # Remove leading &
    QUERY="${QUERY#&}"
    
    # Make the API request without jq formatting
    curl -s --request GET \
      --url "https://api.scrapin.io/v1/enrichment/jobs/search?${QUERY}" \
      --header "X-API-Key: ${API_KEY}" \
      --header "Accept: application/json"
else
    # Build query string using jq for URL encoding
    QUERY=""
    if [ -n "$KEYWORDS" ]; then
        ENCODED_KEYWORDS=$(echo -n "$KEYWORDS" | jq -sRr @uri)
        QUERY="${QUERY}&keywords=${ENCODED_KEYWORDS}"
    fi
    if [ -n "$LOCATION" ]; then
        ENCODED_LOCATION=$(echo -n "$LOCATION" | jq -sRr @uri)
        QUERY="${QUERY}&location=${ENCODED_LOCATION}"
    fi
    if [ -n "$COMPANY_URL" ]; then
        ENCODED_COMPANY=$(echo -n "$COMPANY_URL" | jq -sRr @uri)
        QUERY="${QUERY}&companyUrl=${ENCODED_COMPANY}"
    fi
    QUERY="${QUERY}&page=${PAGE}&size=${SIZE}"
    
    # Remove leading &
    QUERY="${QUERY#&}"
    
    # Make the API request with jq formatting
    curl -s --request GET \
      --url "https://api.scrapin.io/v1/enrichment/jobs/search?${QUERY}" \
      --header "X-API-Key: ${API_KEY}" \
      --header "Accept: application/json" | jq '.'
fi