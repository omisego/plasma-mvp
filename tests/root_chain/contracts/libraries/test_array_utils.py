import pytest


@pytest.fixture
def array_utils_helper(get_contract):
    return get_contract('TestsHelper/TestArrayUtils.sol')


def test_index_of(array_utils_helper):
    array_utils_helper.testIndexOf()


def test_remove(array_utils_helper):
    array_utils_helper.testRemove()
