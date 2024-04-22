import sys

print(f'Argument List: {sys.argv}')

import argparse
parser = argparse.ArgumentParser()

parser.add_argument("-w", "--word", type=str)
parser.add_argument("-n", "--number", type=int)
parser.add_argument("-t", "--toggle", type=bool)

args = parser.parse_args()

print(args)
print(args.word)
print(args.number)
print(args.toggle)