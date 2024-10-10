#!/bin/bash
IMAGE_TO_DEPLOY="This is rajat"
buildkite-agent meta-data set "my_image" "$IMAGE_TO_DEPLOY"
CLOUD_RUN_IMAGE=$(buildkite-agent meta-data get "my_image")
echo $CLOUD_RUN_IMAGE
