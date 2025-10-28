// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//  实现罗马数字转整数
contract RomanToInteger{
     // 罗马字符到数值的映射
    function charToValue(bytes1 char) internal pure returns (uint256) {
        if (char == 'I') return 1;
        if (char == 'V') return 5;
        if (char == 'X') return 10;
        if (char == 'L') return 50;
        if (char == 'C') return 100;
        if (char == 'D') return 500;
        if (char == 'M') return 1000;
        revert("Invalid Roman numeral");
    }

    // 主转换函数
    function romanToInt(string memory s) public pure returns (uint256) {
        bytes memory roman = bytes(s);
        uint256 total = 0;
        uint256 prevValue = 0;

        for (uint256 i = 0; i < roman.length; i++) {
            uint256 currentValue = charToValue(roman[i]);
            // 如果前一个值小于当前值，说明是 IV/IX/XL 等情况
            if (prevValue < currentValue) {
                total += currentValue - 2 * prevValue; // 减去之前误加的值
            } else {
                total += currentValue;
            }
            prevValue = currentValue;
        }
        return total;
    }

}