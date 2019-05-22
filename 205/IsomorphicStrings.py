#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019-05-22 00:33
# @Author  : Yuecheng Jing
# @Site    : www.nanosparrow.com
# @File    : IsomorphicStrings
# @Software: PyCharm

class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        dic = {}
        for i in range(0, len(s)):
            if dic.get(s[i]) is None:
                if t[i] in dic.values():
                    return False
                dic[s[i]] = t[i]
            else:
                if dic[s[i]] != t[i]:
                    return False
        return True

sol = Solution()
print(sol.isIsomorphic("ab", "aa"))
