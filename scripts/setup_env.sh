#!/usr/bin/env bash
# Simulates an infrastructure failure on seed/infra PRs, attempt 1 only.
if [[ "$GITHUB_HEAD_REF" == *"seed/infra"* && "$GITHUB_RUN_ATTEMPT" == "1" ]]; then
  echo "ERROR: lost communication with the server"
  echo "The runner has received a shutdown signal"
  exit 1
fi
echo "environment ok"
