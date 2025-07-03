#!/bin/bash

# Current Date and Time Script
# Returns the current date and time in a readable format

set -e

# Get current date and time
current_date=$(date '+%Y-%m-%d %H:%M:%S')

# Output the current date and time
echo "Current date and time: $current_date"