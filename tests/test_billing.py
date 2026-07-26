from billing import compute


def test_compute():
    assert compute(100) == 90.0
