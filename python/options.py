import argparse

parser = argparse.ArgumentParser()

parser.add_argument('-b', '--bar', help='bar', action='store', dest='bar')
parser.add_argument('-f', '--foo', help='foo', action='store', dest='foo')

options = parser.parse_args()

for arg in sorted(options.__dict__):
    if options.__dict__[arg] == None:
        print("You must specify " + arg)
        import sys
        sys.exit(1)
