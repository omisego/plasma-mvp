pragma solidity ^0.4.18;

library ArrayUtils {
    function remove(uint256[] storage _array, uint256 _value)
        internal
        returns (bool success)
    {
        int256 index = indexOf(_array, _value);
        if (index == -1) {
            return false;
        }
        uint256 lastElement = _array[_array.length - 1];
        _array[uint256(index)] = lastElement;

        delete _array[_array.length - 1];
        _array.length -= 1;
        return true;
    }

    function indexOf(uint256[] _array, uint256 _value)
        internal
        pure
        returns(int256 index)
    {
        for (uint256 i = 0; i < _array.length; i++) {
            if (_array[i] == _value) {
                return int256(i);
            }
        }
        return -1;
    }
}
