import unittest
from gradescope_utils.autograder_utils.json_test_runner import JSONTestRunner
import socket


if __name__ == "__main__":
    suite = unittest.defaultTestLoader.discover("tests")

    if socket.gethostname() == "home":
        prefix = "."
    else:
        prefix = "/autograder"

    results_file = f"{prefix}/results/results.json"
    with open(results_file, "w") as f:
        JSONTestRunner(visibility="visible", stream=f).run(suite)
