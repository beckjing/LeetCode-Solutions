#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/11/1 08:22
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : ZigZagConversion
# @Software: PyCharm


class Solution(object):
    # def convert(self, s, numRows):
    #     """
    #     :type s: str
    #     :type numRows: int
    #     :rtype: str
    #     """
    #     if numRows == 1:
    #         return s
    #     tempStringList = []
    #     resultString = ""
    #     row = 0
    #     step = 1
    #     for x in range(0, numRows):
    #         tempStringList.append("")
    #     for y in range(0, len(s)):
    #         rowString = tempStringList[row]
    #         rowString.append(s[y])
    #         row += step
    #         if row == 0:
    #             step = 1
    #         elif row == (numRows - 1):
    #             step = -1
    #     for z in xrange(0, numRows):
    #         resultString.append(tempStringList[z])
    def convert(self, s, numRows):
        """
        :type s: str
        :type numRows: int
        :rtype: str
        """
        if numRows == 1:
            return s

