#!/bin/bash

timeout_seconds=50 # 14 minutes
start_time=$(date +%s)

# Simulate a long-running process
while true; do
  sleep 1
  current_time=$(date +%s)
  elapsed_time=$((current_time - start_time))

  if [[ $elapsed_time -gt $timeout_seconds ]]; then
    echo "Internal timeout exceeded!"
    exit 1 # Exit with a non-zero status
  fi
done
