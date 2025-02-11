#!/bin/bash

# Get the current day of the week (1-7, where 1 is Monday and 7 is Sunday)
DAY_OF_WEEK=$(date +%u)

# Define the logic to determine skipping
# Skip on weekends (6 for Saturday, 7 for Sunday)
if [[ "$DAY_OF_WEEK" == "6" || "$DAY_OF_WEEK" == "7" ]]; then
    echo "true"
else
    echo "false"
fi
