#!/usr/bin/env bash
# Simulates a dependency-resolution failure on seed/dependency PRs.
if [[ "$GITHUB_HEAD_REF" == *"seed/dependency"* ]]; then
  pip install koredex-gauntlet-nonexistent-package==99.99.99
  exit $?
fi
pip install -r requirements.txt
