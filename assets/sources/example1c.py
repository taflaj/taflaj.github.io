# example3.py
# with Numba

import sys
from random import random

from numba import njit


@njit
def calculate(n: int) -> float:
    inside = 0
    for _ in range(n):
        x = random()
        y = random()
        if x * x + y * y <= 1.0:
            inside += 1
    return inside * 4 / n


if __name__ == "__main__":
    n = 100_000_000 if len(sys.argv) == 1 else int(sys.argv[1])
    print(calculate(n))
