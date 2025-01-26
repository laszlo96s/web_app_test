#!/bin/bash

# Path to the log file
LOG_FILE="logs/access.log"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found: $LOG_FILE"
  exit 1
fi

# Parse the log file and count requests per endpoint
echo "Request count per endpoint:"
awk '{
  endpoint=$7
  status=$9
  count[endpoint]++
  if (status == 404 || status == 500) {
    highlight[endpoint] = status
  }
} 
END {
  for (endpoint in count) {
    if (highlight[endpoint] == 404) {
      printf "\033[33m%-10s %s (404)\033[0m\n", count[endpoint], endpoint
    } else if (highlight[endpoint] == 500) {
      printf "\033[31m%-10s %s (500)\033[0m\n", count[endpoint], endpoint
    } else {
      printf "%-10s %s\n", count[endpoint], endpoint
    }
  }
}' "$LOG_FILE" | sort -nr
