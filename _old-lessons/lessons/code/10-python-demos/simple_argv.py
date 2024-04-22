# import sys
# print(sys.
# myscript.py

import argparse
parser = argparse.ArgumentParser()

parser.add_argument("-w", "--word", type=str)
parser.add_argument("-n", "--number", type=int)
args = parser.parse_args()

print(args.word)
print(args.number)
