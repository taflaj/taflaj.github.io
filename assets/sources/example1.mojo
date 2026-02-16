# example1.mojo

import random
from sys import argv

fn main() raises -> None:
    n = 100_000_000 if len(argv()) == 1 else Int(argv()[1])
    random.seed()
    inside = 0
    for _ in range(n):
        x = random.random_float64()
        y = random.random_float64()
        if x*x + y*y <= 1:
            inside += 1
    print(inside * 4 / n)
