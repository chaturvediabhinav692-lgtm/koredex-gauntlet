"""Simulates an upstream service/module that seed PRs never touch."""


def get_value():
    raise ConnectionError("upstream service timeout: connection to payments-svc failed")
