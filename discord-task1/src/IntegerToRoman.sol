// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 实现整数转罗马数字
contract IntegerToRoman {
    function intToRoman(uint256 num) public pure returns (string memory) {
        require(num >= 1 && num <= 3999, "Out of range");

        // 按位数预定义符号
        string[10][4] memory digitMap = [
            ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"], // 个位
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"], // 十位
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"], // 百位
            ["", "M", "MM", "MMM", "", "", "", "", "", ""] // 千位
        ];

        bytes memory result = new bytes(16);
        uint256 ptr = 0;

        // 处理千位
        uint256 thousands = num / 1000;
        if (thousands > 0) {
            bytes memory symbols = bytes(digitMap[3][thousands]);
            for (uint256 j = 0; j < symbols.length; j++) {
                result[ptr++] = symbols[j];
            }
        }

        // 处理百位
        uint256 hundreds = (num % 1000) / 100;
        if (hundreds > 0) {
            bytes memory symbols = bytes(digitMap[2][hundreds]);
            for (uint256 j = 0; j < symbols.length; j++) {
                result[ptr++] = symbols[j];
            }
        }

        // 处理十位和个位（类似逻辑）
        uint256 tens = ((num % 1000) % 100) / 10;
        if (tens > 0) {
            bytes memory symbols = bytes(digitMap[1][tens]);
            for (uint256 j = 0; j < symbols.length; j++) {
                result[ptr++] = symbols[j];
            }
        }

        uint256 units = ((num % 1000) % 100) % 10;
        if (units > 0) {
            bytes memory symbols = bytes(digitMap[0][units]);
            for (uint256 j = 0; j < symbols.length; j++) {
                result[ptr++] = symbols[j];
            }
        }

        // 截取有效部分
        bytes memory finalResult = new bytes(ptr);
        for (uint256 k = 0; k < ptr; k++) {
            finalResult[k] = result[k];
        }

        return string(finalResult);
    }
}
