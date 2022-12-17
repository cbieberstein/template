def inc(val: int) -> int:
    return val + 1


if __name__ == "__main__":
    print(f"{inc(1)} = 1 + 1")  # pragma: no cover
    print("Hi there")  # pragma: no cover
