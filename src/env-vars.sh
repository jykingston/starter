#!/bin/bash
set -euo pipefail

echo "Importing the env vars"
env_vars=$(<"$BUILDKITE_ENV_FILE")

declare -a env_vars_array

# Add existing environment variables
env_vars_array+=("$env_vars")

# Append additional environment variables to the array
env_vars_array+=(
  "BUILDKITE_AGENT_DEBUG=\"null\""  # Explicitly set to "null"
  "BUILDKITE_BUILD_PATH=${BUILDKITE_BUILD_PATH_SUBAGENT:-$BUILDKITE_BUILD_PATH}"
)

# Output the variables
echo "Output:"
for var in "${env_vars_array[@]}"; do
    echo "$var"
done
