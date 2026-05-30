#_______________________________________________________________________
# DESCRIPTION
# Simple test of the argparse module for parsing command line arguments.
#_______________________________________________________________________
import argparse

if __name__ == '__main__':
  parser: argparse.ArgumentParser = argparse.ArgumentParser()
  parser.add_argument('--in0', '-i0', help='Input 0', action='store')
  parser.add_argument('--in1', '-i1', help='Input 1', action='store')
  args: argparse.Namespace = parser.parse_args()

  print(str(
    f'\nInput argument 0: {args.in0}'
    f'\nInput argument 1: {args.in1}'
    )
  )