#!/bin/bash

IMAGE_TO_DEPLOY="This is rajat"
buildkite-agent meta-data set "my_image" "${IMAGE_TO_DEPLOY}"
buildkite-agent meta-data get "my_image"
