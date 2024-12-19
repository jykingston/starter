#!/bin/bash
set -euo pipefail

echo "Importing the env vars"
env_vars=$(<"$BUILDKITE_ENV_FILE")

declare -a env_vars_array

# Add existing environment variables
env_vars_array+=("$env_vars")

# Append additional environment variables to the array
env_vars_array+=(
   "BUILDKITE_AGENT_ACCESS_TOKEN=${BUILDKITE_AGENT_ACCESS_TOKEN_SUBAGENT:-$BUILDKITE_AGENT_ACCESS_TOKEN}"
   "BUILDKITE_BUILD_PATH=${BUILDKITE_BUILD_PATH_SUBAGENT:-$BUILDKITE_BUILD_PATH}"
   "BUILDKITE_HOOKS_PATH=${BUILDKITE_HOOKS_PATH_SUBAGENT:-$BUILDKITE_HOOKS_PATH}"
   "BUILDKITE_PLUGINS_PATH=${BUILDKITE_PLUGINS_PATH_SUBAGENT:-$BUILDKITE_PLUGINS_PATH}"
   "BUILDKITE_PLUGINS_ENABLED=${BUILDKITE_PLUGINS_ENABLED_SUBAGENT:-$BUILDKITE_PLUGINS_ENABLED}"
   "BUILDKITE_PLUGIN_VALIDATION=${BUILDKITE_PLUGIN_VALIDATION_SUBAGENT:-$BUILDKITE_PLUGIN_VALIDATION}"
   "BUILDKITE_LOCAL_HOOKS_ENABLED=${BUILDKITE_LOCAL_HOOKS_ENABLED_SUBAGENT:-$BUILDKITE_LOCAL_HOOKS_ENABLED}"
   "BUILDKITE_SSH_KEYSCAN=${BUILDKITE_SSH_KEYSCAN_SUBAGENT:-$BUILDKITE_SSH_KEYSCAN}"
   "BUILDKITE_AGENT_DEBUG=${BUILDKITE_AGENT_DEBUG_SUBAGENT:-$BUILDKITE_AGENT_DEBUG}"
)

# Output the variables
echo "Output:"
for var in "${env_vars_array[@]}"; do
    echo "$var"
done
