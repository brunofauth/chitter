from chitter import ChainableIter


def test():
    l = [1, 2, 3]
    assert ChainableIter(l).map(lambda x: x**2).to_list() == [1, 4, 9]
    assert ChainableIter.range(2, -2, -1).to_list() == [2, 1, 0, -1]
