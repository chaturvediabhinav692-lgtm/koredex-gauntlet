"""Active ONLY on seed/flaky PRs. Fails on run attempt 1, passes on
attempt 2 — a deterministic simulation of a flaky test, so the
rerun-confirm loop demos reliably."""
import os

import pytest

ACTIVE = "seed/flaky" in os.environ.get("GITHUB_HEAD_REF", "")


@pytest.mark.skipif(not ACTIVE, reason="only active on seed/flaky")
def test_intermittent_behavior():
    attempt = os.environ.get("GITHUB_RUN_ATTEMPT", "1")
    assert attempt != "1", "simulated flaky failure on first attempt"
