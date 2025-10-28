// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 在一个有序数组中查找目标值
contract BinarySearch {
    function isSorted(uint256[] memory arr) public pure returns (bool) {
        if (arr.length <= 1) return true;

        for (uint256 i = 1; i < arr.length; i++) {
            if (arr[i - 1] > arr[i]) {
                return false;
            }
        }
        return true;
    }

    function getTarget(uint256[] memory arr, uint256 target)
        public
        pure
        returns (uint256)
    {
        require(isSorted(arr), "Array must be sorted");
        uint256 _low = 0;
        uint256 _high = arr.length;

        while (_low < _high) {
            uint256 mid = (_low + (_high - _low)) >> 1; // 防溢出写法,相当于_low + (_high - _low)/2 向下取整

            uint256 val = arr[mid]; // 只读取一次存储
            if (val == target) return mid;
            if (val < target) {
                _low = mid + 1;
            } else {
                _high = mid;
            }
        }
        revert("Not found"); 
    }
}
