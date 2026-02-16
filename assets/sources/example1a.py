# example1.py
# with secrets

import secrets
import sys


def get_random() -> float:
    return secrets.randbelow(1000) / 1000


def is_inside(x: float, y: float) -> bool:
    return x * x + y * y <= 1


n = 100_000_000 if len(sys.argv) == 1 else int(sys.argv[1])
inside = 0
for _ in range(n):
    if is_inside(get_random(), get_random()):
        inside += 1
print(inside * 4 / n)
