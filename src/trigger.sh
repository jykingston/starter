#!/bin/bash

# Temporary file to hold the pipeline configuration
temp_pipeline="dynamic-pipeline.yml"

# Create the trigger step for another pipeline
cat <<EOF > $temp_pipeline
steps:
  - label: "Trigger another pipeline"
    trigger: "metadata-starter"
    async: true
    soft_fail: true
    build:
      message: "Triggered by ${BUILDKITE_PIPELINE_SLUG}"
EOF

# Upload the dynamically generated pipeline configuration
buildkite-agent pipeline upload $temp_pipeline

# Optional: Sleep for a certain period if needed to observe the behavior
sleep 10

# Fail the script intentionally
echo "This step will intentionally fail."
exit 1
