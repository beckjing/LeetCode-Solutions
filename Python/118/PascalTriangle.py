#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-01-16 00:03
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : PascalTriangle
# @Software: PyCharm

class Solution:
    def generate(self, numRows):
        """
        :type numRows: int
        :rtype: List[List[int]]
        """
        result = []
        for x in range(0, numRows):
            tempList = [1] * (x + 1)
            for y in range(1, x):
                tempList[y] = result[x - 1][y - 1] + result[x - 1][y]
            print(tempList)
            result.append(tempList)
        return result

if __name__ == '__main__':
    test = Solution()
    print(test.generate(6))