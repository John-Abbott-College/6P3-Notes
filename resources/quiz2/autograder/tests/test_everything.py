import unittest
from pathlib import Path
import os

def is_word_in_file(word: str, flines: list[str]) -> bool:
    return len([line for line in flines if word.lower() in line.lower()]) > 0

from gradescope_utils.autograder_utils.decorators import weight, visibility

class TestFiles(unittest.TestCase):
    def setUp(self):
        submission_prefix = "/autograder/submission"
        self.requirements_file = f"{submission_prefix}/requirements.txt"
        self.config_file = f"{submission_prefix}/config.sh"
        self.script_file = f"{submission_prefix}/script.py"

    @weight(0.1)
    def test_requirements_file_exists(self):
        """requirements file exists."""
        self.assertTrue(Path(self.requirements_file).exists())

    @weight(0.1)
    def test_config_file_exists(self):
        """config file exists."""
        self.assertTrue(Path(self.config_file).exists())
        # Code for user setting test, just in case I want to use it later
        # original_username = subprocess.check_output("echo $USER", text=True).rstrip()
        # subprocess.run(f"source ${self.config_file}")
        # final_username = subprocess.check_output("echo $USER", text=True).rstrip()
        # self.assertTrue(original_username != final_username)

    @weight(0.1)
    def test_script_file_exists(self):
        """script file exists."""
        self.assertTrue(Path(self.script_file).exists())

    @weight(0.3)
    def test_script_file_shebang(self):
        """script file needs to have appropriate python shebang on first line of file."""
        words = ["#!/usr/bin/env python"]
        with Path(self.script_file).open("r") as f:
            first_line = [f.readline()]
        self.assertTrue(any(is_word_in_file(word, first_line) for word in words),
                        msg=f"{os.path.basename(self.script_file)} does not have first line containing: {words}")

    @weight(0.3)
    def test_requirements_file_contains_grove_dependency(self):
        """requirements.txt has grove.py dependency sourced from github"""
        words = ["git+https://github.com/Seeed-Studio/grove.py", "Seeed-grove.py"]
        with Path(self.requirements_file).open("r") as f:
            flines = f.readlines()
        self.assertTrue(any(is_word_in_file(word, flines) for word in words), msg=f"{os.path.basename(self.requirements_file)} does not contain any of: {words}")

    @weight(0.1)
    def test_requirements_file_contains_grove_dependency_from_github(self):
        """requirements.txt grove.py dependency is sourced from github"""
        word = "git+https://github.com/Seeed-Studio/grove.py"
        with Path(self.requirements_file).open("r") as f:
            flines = f.readlines()
        self.assertTrue(is_word_in_file(word, flines), msg=f"{os.path.basename(self.requirements_file)} does not include {word}")
