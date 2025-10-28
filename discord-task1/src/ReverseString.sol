// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
contract ReverseString {
    function reverseString(string memory str)
        public
        pure
        returns (string memory)
    {
        bytes memory strBytes = bytes(str);
        uint256 len = strBytes.length;

        for (uint256 i = 0; i < len / 2; i++) {
            bytes1 temp = strBytes[i];
            strBytes[i] = strBytes[len - 1 - i];
            strBytes[len - 1 - i] = temp;
        }

        return string(strBytes);
    }
}
