// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 合并两个有序数组 (Merge Sorted Array)
contract MergeSortedArray {
    function mergeSortedArrays(uint256[] memory a, uint256[] memory b)
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory merged = new uint256[](a.length + b.length);
        uint256 i = 0; // a 的指针
        uint256 j = 0; // b 的指针
        uint256 k = 0; // merged 的指针

        // 遍历两个数组，选择较小的元素
        while (i < a.length && j < b.length) {
            if (a[i] <= b[j]) {
                merged[k++] = a[i++];
            } else {
                merged[k++] = b[j++];
            }
        }

        // 处理剩余元素
        while (i < a.length) merged[k++] = a[i++];
        while (j < b.length) merged[k++] = b[j++];

        return merged;
    }
}
