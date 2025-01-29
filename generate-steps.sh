#!/bin/bash

echo "steps:"

# Generate 5 dynamic steps with parallelism
for i in {1..5}
do
  cat <<EOF
  - command: "echo Processing part $i"
    label: ":echo: Echo part $i"
    parallelism: 5
EOF
done
