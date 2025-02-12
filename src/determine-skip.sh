#!/bin/bash

# export SKIP_TESTS=false
export SKIP_TESTS=true
echo "Skip Tests = $SKIP_TESTS"

# Run agent pipeline upload for the step if it didn't Skip
if [ "$SKIP_TESTS" = false ]; then
    echo "Run Tests"
    buildkite-agent pipeline upload .buildkite/pipeline.yml >> buildkite-env.sh
else
    echo "Skip Tests"
    buildkite-agent pipeline upload .buildkite/pipeline-skip.yml >> buildkite-env.sh
fi
