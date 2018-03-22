pragma solidity ^0.4.18;
import 'ArrayUtils.sol';

contract TestArrayUtils {
    using ArrayUtils for uint256[];

    function TestArrayUtils() public {

    }

    function testIndexOf() public {
        uint256[] array;
        array.push(1);
        array.push(2);
        array.push(3);
        assert(array.indexOf(1) == 0);
        assert(array.indexOf(2) == 1);
        assert(array.indexOf(3) == 2);
    }

    function testRemove() public {
        uint256[] array;
        array.push(1);
        array.push(2);
        array.push(3);
        array.remove(1);
        assert(array.length == 2);

        assert(array.remove(1) == false);

        array.remove(2);
        assert(array.length == 1);
        array.remove(3);
        assert(array.length == 0);
    }
}
