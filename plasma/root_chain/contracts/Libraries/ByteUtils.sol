pragma solidity 0.4.18;


/**
 * @title Bytes operations
 *
 * @dev Based on https://github.com/GNSPS/solidity-bytes-utils/blob/master/contracts/BytesLib.sol
 */
library ByteUtils {
    // Based on https://ethereum.stackexchange.com/a/40922 with some modification
    function bytes32ToBytes(bytes32 data) internal pure returns (bytes memory result) {
        uint i = 0;
        uint j = 0;

        while (i < 32 && uint(data[i]) == 0) {
            ++i;
        }

        result = new bytes(32 - i);

        while (i < 32) {
            result[j] = data[i];
            ++i;
            ++j;
        }

        return result;
    }

    function slice(bytes _bytes, uint _start, uint _length)
        internal
        pure
        returns (bytes)
    {

        bytes memory tempBytes;

        assembly {
            tempBytes := mload(0x40)

            let lengthmod := and(_length, 31)

            let mc := add(tempBytes, lengthmod)
            let end := add(mc, _length)

            for {
                let cc := add(add(_bytes, lengthmod), _start)
            } lt(mc, end) {
                mc := add(mc, 0x20)
                cc := add(cc, 0x20)
            } {
                mstore(mc, mload(cc))
            }

            mstore(tempBytes, _length)

            //update free-memory pointer
            //allocating the array padded to 32 bytes like the compiler does now
            mstore(0x40, and(add(mc, 31), not(31)))
        }

        return tempBytes;
    }
}
