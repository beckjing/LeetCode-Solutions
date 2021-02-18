#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/11/18 
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : StringToInteger
# @Software: PyCharm

class Solution:
    charNumber = ('-', '+', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
    def myAtoi(self, str):
        """
        :type str: str
        :rtype: int
        """
        result = 0
        symbol = 0
        start = True
        for s in str:
            if s == ' ':
                if start:
                    continue
                else:
                    break
            if s in self.charNumber:
                start = False
                if s == '-':
                    if result == 0 and symbol == 0:
                        symbol = -1
                    else:
                        break
                elif s == '+':
                    if result == 0 and symbol == 0:
                        symbol = 1
                    else:
                        break
                else:
                    if symbol == 0:
                        symbol = 1
                    result = result * 10 + int(s)
            else:
                break
        if (result * symbol) > (2 ** 31 - 1):
            return 2 ** 31 - 1
        elif result * symbol <= (- 2 ** 31):
            return - 2 ** 31
        return result * symbol


if __name__ == '__main__':
    test = Solution()
    integer = test.myAtoi('42')
    print(integer)
