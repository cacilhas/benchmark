#!/usr/bin/env python3

from random import randint
from typing import List

def main() -> None:
  # Setup
  data: List[int] = [randint(0, 99) for _ in range(100)]

  # Process
  qsort(data)

  # Output
  print('\t'.join(str(x) for x in data))


def qsort(data: List[int]) -> None:
  if len(data) > 1:
    pivot: int = data[0]
    left: List[int] = [x for x in data[1:] if x < pivot]
    right: List[int] = [x for x in data[1:] if x >= pivot]
    qsort(left)
    qsort(right)
    i: int = 0
    for value in left:
      data[i] = value
      i += 1
    data[i] = pivot
    i += 1
    for value in right:
      data[i] = value
      i += 1


if __name__ == '__main__':
  main()
