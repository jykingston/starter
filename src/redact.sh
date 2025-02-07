# Add redaction rule
echo "136898a15c734aeea4b61fdb6111111" | buildkite-agent redactor add
echo "pagerduty_change_event" | buildkite-agent redactor add

# Continue with other commands
