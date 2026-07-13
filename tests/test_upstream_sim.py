"""Active ONLY on seed/not-your-code PRs. Fails deterministically
with a traceback in upstream_module.py — a file no seed PR touches."""
import os

import pytest

ACTIVE = "seed/not-your-code" in os.environ.get("GITHUB_HEAD_REF", "")


@pytest.mark.skipif(not ACTIVE, reason="only active on seed/not-your-code")
def test_upstream_service_returns_value():
    from upstream_module import get_value

    assert get_value() == 42
