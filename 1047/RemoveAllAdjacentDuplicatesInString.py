#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-05-21 00:36
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : RemoveAllAdjacentDuplicatesInString
# @Software: PyCharm

class Solution:
    def removeDuplicates(self, S: str) -> str:
        result = []
        for char in S:
            result.append(char)
            if len(result) > 1:
                if result[-1] == result[-2]:
                    result.pop()
                    result.pop()
        return ''.join(result)
sol = Solution()
print(sol.removeDuplicates("abbaca"))