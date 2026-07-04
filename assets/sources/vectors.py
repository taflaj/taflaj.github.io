# vectors.py

from math import acos, sqrt


def vectors_angle(a: list[float], b: list[float]) -> float:
    if len(a) != len(b):
        raise RuntimeError("Vectors must have the same dimension")

    def magnitude(v: list[float]) -> float:
        return sqrt(sum([n * n for n in v]))

    product = sum([x * y for x, y in zip(a, b)])
    return acos(product / (magnitude(a) * magnitude(b)))
