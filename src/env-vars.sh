#!/bin/bash
set -euo pipefail

echo "Importing the env vars"
env_vars=$(<"$BUILDKITE_ENV_FILE")

echo "Output them for posterity"
echo $env_vars

env_vars+=(
    BUILDKITE_AGENT_ACCESS_TOKEN="${BUILDKITE_AGENT_ACCESS_TOKEN_SUBAGENT:-$BUILDKITE_AGENT_ACCESS_TOKEN}"
    BUILDKITE_BUILD_PATH="${BUILDKITE_BUILD_PATH_SUBAGENT:-$BUILDKITE_BUILD_PATH}"
    BUILDKITE_HOOKS_PATH="${BUILDKITE_HOOKS_PATH_SUBAGENT:-$BUILDKITE_HOOKS_PATH}"
    BUILDKITE_PLUGINS_PATH="${BUILDKITE_PLUGINS_PATH_SUBAGENT:-$BUILDKITE_PLUGINS_PATH}"
    BUILDKITE_PLUGINS_ENABLED="${BUILDKITE_PLUGINS_ENABLED_SUBAGENT:-$BUILDKITE_PLUGINS_ENABLED}"
    BUILDKITE_PLUGIN_VALIDATION="${BUILDKITE_PLUGIN_VALIDATION_SUBAGENT:-$BUILDKITE_PLUGIN_VALIDATION}"
    BUILDKITE_LOCAL_HOOKS_ENABLED="${BUILDKITE_LOCAL_HOOKS_ENABLED_SUBAGENT:-$BUILDKITE_LOCAL_HOOKS_ENABLED}"
    BUILDKITE_SSH_KEYSCAN="${BUILDKITE_SSH_KEYSCAN_SUBAGENT:-$BUILDKITE_SSH_KEYSCAN}"
    BUILDKITE_AGENT_DEBUG="${BUILDKITE_AGENT_DEBUG_SUBAGENT:-$BUILDKITE_AGENT_DEBUG}"
)

echo "output with new values"
echo
echo ${env_vars[@]}
echo
echo "Basic echo without array"
echo $env_vars
echo
echo "Basic echo with zsh"
#zsh -c "echo \"$env_vars\""
echo "with zsh array"
zsh -c "echo \"${env_vars[@]}\""
