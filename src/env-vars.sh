#!/bin/bash
set -euo pipefail

echo "Importing the env vars"
env_vars=$(<"$BUILDKITE_ENV_FILE")

# Declare the escaped array (forced quotes)
declare -a env_vars_array

# Add existing environment variables
env_vars_array+=("$env_vars")

# Append additional environment variables to the array (subset)
env_vars_array+=( 
  "BUILDKITE_BUILD_PATH=\"${BUILDKITE_BUILD_PATH_SUBAGENT:-$BUILDKITE_BUILD_PATH}\"" # This is correctly escaped
)

# Output the variables
echo "Output BASH"
bash -c "echo \"${env_vars_array[@]}\""
echo "Output ZSH"
zsh -c "echo \"${env_vars_array[@]}\""
