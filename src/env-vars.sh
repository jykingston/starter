#!/bin/bash
set -euo pipefail

echo "Importing the env vars"
env_vars=$(<"$BUILDKITE_ENV_FILE")

echo "Output them for posterity"
echo $env_vars

env_vars+=(
    BUILDKITE_AGENT_ACCESS_TOKEN=""
    BUILDKITE_BUILD_PATH=""
    BUILDKITE_HOOKS_PATH=""
    BUILDKITE_PLUGINS_PATH=""
)

echo "output with formatting lah"
echo
echo ${env_vars[@]}
echo
echo "Print without formatting"
echo $env_vars
echo
echo "with zsh"
zsh -c "echo \"$env_vars\""
#for var in "${env_vars[@]}"; do
#  echo "$var"
#done
#env_vars="${env_vars[@]}"  # Correctly combine the array into a single string

#echo
#echo "testing with zsh"
#escaped_vars=$(printf '%q ' "${env_vars[@]}")
#zsh -c "echo \"$escaped_vars\""
