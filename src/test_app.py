import pytest

from app import inc

test_data = [[-2, -1], [-1, 0], [0, 1], [1, 2]]
test_name = ["neg-neg", "neg-zero", "zero-pos", "pos-pos"]


@pytest.mark.parametrize("val, expected", test_data, ids=test_name)
def test_inc(val, expected):
    assert inc(val) == expected
