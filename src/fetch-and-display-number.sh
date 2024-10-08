#!/bin/bash

action=${1:-}

if [[ "$action" == "collect" ]]; then
  parallel_numbers=$(buildkite-agent meta-data get steps-count)
  echo "Fetching $parallel_numbers parallel numbers..."

  for ((i = 0; i < parallel_numbers; i++)); do
    (
      set -x
      buildkite-agent meta-data get "generated-number::$i"
    )
    echo
  done
else
  (
    set -x
    BUILDKITE_JOB_ID="0191d3e3-4f86-45a5-8208-02294c0941e4"
    buildkite-agent meta-data --job $BUILDKITE_JOB_ID get generated-number
  )
fi
echo
echo
